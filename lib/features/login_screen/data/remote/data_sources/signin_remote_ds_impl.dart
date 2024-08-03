import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api_endpoints.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/core/services/failures.dart';
import 'package:e_commerce/features/login_screen/data/remote/data_sources/signin_remote_ds.dart';
import 'package:e_commerce/core/models/usermodel.dart';
import 'package:either_dart/src/either.dart';

import '../../../../../core/services/app_exception.dart';

class SigninRemoteDsImpl implements SigninRemoteDs {
 ApiManager apiManager;

 SigninRemoteDsImpl(this.apiManager);

 @override
 Future<Either<Failure, UserModel>> signIn(
     String email, String password) async{
   try {
     var response = await apiManager.post(
          ApiEndpoints.login
         ,{"email": email, "password": password});
     UserModel userModel = UserModel.fromJson(response.data);
     return Right(userModel);
   }
   on DioException catch (e) {
     // Catching DioException specifically
     return Left(ServerFailure.fromDioError(e));
   } catch (e) {
     return Left(ServerFailure(e.toString()));
   }
 }

}