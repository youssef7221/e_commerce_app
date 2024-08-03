import 'package:e_commerce/core/services/failures.dart';
import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/signup_screen/data/remote/data_sources/signup_ds.dart';
import 'package:e_commerce/features/signup_screen/data/remote/data_sources/signup_remote_ds_impl.dart';
import 'package:e_commerce/features/signup_screen/domain/repositories/signup_repo.dart';
import 'package:either_dart/src/either.dart';

import '../../../../core/services/app_exception.dart';

class SignUpRepoImpl implements SignupRepo {
 SignupRemoteDs signupRemoteDs;

 SignUpRepoImpl(this.signupRemoteDs);

  @override
  Future<Either<Failure, UserEntity>> signUp(String email , String name , String password,String rePassword,String phone ) {
   print("RepoImpl");
   return signupRemoteDs.signUp(email,name,password,rePassword,phone);
  }

}