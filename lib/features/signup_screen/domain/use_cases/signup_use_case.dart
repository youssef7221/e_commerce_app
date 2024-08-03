import 'package:e_commerce/core/services/failures.dart';
import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/signup_screen/data/repositories/sign_up_impl.dart';
import 'package:e_commerce/features/signup_screen/domain/repositories/signup_repo.dart';
import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';

class SignupUseCase{

 SignupUseCase(this.signupRepo);
 SignupRepo signupRepo;
 Future<Either<Failure,UserEntity>> call(String email , String name , String password,String rePassword,String phone ){
   print("usecase");
   return signupRepo.signUp(email,name,password,rePassword,phone);
  }
}