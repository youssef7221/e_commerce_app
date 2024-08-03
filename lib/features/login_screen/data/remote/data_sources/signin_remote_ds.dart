import 'package:e_commerce/core/models/usermodel.dart';
import 'package:either_dart/either.dart';

import '../../../../../core/services/app_exception.dart';
import '../../../../../core/services/failures.dart';
import '../../../domain/entities/UserEntity.dart';

abstract class SigninRemoteDs {

  Future<Either<Failure,UserModel>> signIn( String email, String password);
}