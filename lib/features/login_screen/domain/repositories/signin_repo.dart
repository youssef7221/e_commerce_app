import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';
import '../../../../core/services/failures.dart';
import '../entities/UserEntity.dart';

abstract class SignInRepo {
  Future<Either<Failure,UserEntity>> signIn( String email, String password);
}