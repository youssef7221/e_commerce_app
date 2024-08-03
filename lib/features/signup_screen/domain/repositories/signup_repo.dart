import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';
import '../../../../core/services/failures.dart';
import '../../../login_screen/domain/entities/UserEntity.dart';

abstract class SignupRepo {
  Future<Either<Failure,UserEntity>> signUp(String email , String name , String password ,String rePassword,String phone);
}