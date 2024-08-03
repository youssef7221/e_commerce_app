import 'package:either_dart/either.dart';

import '../../../../../core/models/usermodel.dart';
import '../../../../../core/services/app_exception.dart';
import '../../../../../core/services/failures.dart';

abstract class SignupRemoteDs {
  Future<Either<Failure,UserModel>> signUp(String email , String name , String password ,String rePassword,String phone);
}