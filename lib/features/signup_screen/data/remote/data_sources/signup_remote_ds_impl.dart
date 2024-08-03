import 'package:dio/dio.dart';
import 'package:e_commerce/core/models/usermodel.dart';
import 'package:e_commerce/core/services/api_endpoints.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/core/services/failures.dart';
import 'package:e_commerce/features/login_screen/data/remote/data_sources/signin_remote_ds.dart';
import 'package:e_commerce/features/signup_screen/data/remote/data_sources/signup_ds.dart';
import 'package:either_dart/src/either.dart';
import 'package:http/http.dart';

import '../../../../../core/services/app_exception.dart';

class SignupRemoteDsImpl implements SignupRemoteDs {
  ApiManager apiManager;

  SignupRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failure, UserModel>> signUp(
      String email, String name, String password,String rePassword,String phone) async {
    try {
      var response = await apiManager.post(ApiEndpoints.signUp,
          {"email":email, "name":name, "password":password , "rePassword":rePassword,"phone":phone});
      UserModel userModel = UserModel.fromJson(response.data);
      print("asd");
      print(response.data);
      return Right(userModel);
    }
    on DioException catch (e) {
      // Catching DioException specifically
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
