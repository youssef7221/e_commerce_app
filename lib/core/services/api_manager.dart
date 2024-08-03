import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api_endpoints.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> get(String endpoint,String data) async{
    Response response  = await dio.get("${ApiEndpoints.baseUrl}$endpoint",data:data);
    return response;
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async{
    Response response  = await dio.post("${ApiEndpoints.baseUrl}$endpoint",data: data);
    print(response.data);
    return response;
  }
}