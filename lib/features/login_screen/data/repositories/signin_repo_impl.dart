import 'package:e_commerce/core/services/failures.dart';
import 'package:e_commerce/features/login_screen/data/remote/data_sources/signin_remote_ds.dart';
import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/login_screen/domain/repositories/signin_repo.dart';
import 'package:either_dart/src/either.dart';

import '../../../../core/services/app_exception.dart';

class SigninRepoImpl implements SignInRepo{
  SigninRepoImpl(this.signinRemoteDs);
  SigninRemoteDs signinRemoteDs;
  @override
  Future<Either<Failure, UserEntity>> signIn( String email, String password) {
   return signinRemoteDs.signIn(  email,  password);
  }

}