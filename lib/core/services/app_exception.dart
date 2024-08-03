import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError){
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Incorrect certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request with Api Server canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Error connecting with Api Server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error, please try again');
      default:
        return ServerFailure.fromResponse(dioError.response!);
    }
  }

  factory ServerFailure.fromResponse(Response responce){
    final statusCode = responce.statusCode;
    final response = responce.data;
    if (statusCode == 400 || statusCode == 401) {
      return ServerFailure(response['message']);
    } else if (statusCode == 403) {
      // return RetryOn403Interceptor.onResponse(response, handler);
      return ServerFailure('You are not authorized to access this resource');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Server error, please try again later!');
    }
    else if (statusCode == 409)
    {
      return ServerFailure('This Email already have account');
    }else{
      return ServerFailure('Something went wrong, please try again');
    }
  }
}

class RetryOn403Interceptor extends Interceptor {
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 403) {
      try {
        final requestOptions = response.requestOptions;
        final dio = Dio();
        final newResponse = await dio.request(
          requestOptions.path,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
            responseType: requestOptions.responseType,
            contentType: requestOptions.contentType,
            followRedirects: requestOptions.followRedirects,
            validateStatus: requestOptions.validateStatus,
            receiveDataWhenStatusError:
                requestOptions.receiveDataWhenStatusError,
            extra: requestOptions.extra,
            responseDecoder: requestOptions.responseDecoder,
          ),
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );
        return handler.resolve(newResponse);
      } catch (e) {
        return handler.reject(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: e,
        ));
      }
    } else {
      return handler.next(response);
    }
  }
}
