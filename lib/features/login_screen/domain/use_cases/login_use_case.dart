
import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';
import '../../../../core/services/failures.dart';
import '../entities/UserEntity.dart';
import '../repositories/signin_repo.dart';

class SignInUseCase {
SignInRepo signInRepo;

SignInUseCase(this.signInRepo);

  Future<Either<Failure,UserEntity>> call( String email, String password){
   return signInRepo.signIn(email,password);
}
}