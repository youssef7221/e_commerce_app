import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/models/usermodel.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/signup_screen/data/remote/data_sources/signup_ds.dart';
import 'package:e_commerce/features/signup_screen/data/remote/data_sources/signup_remote_ds_impl.dart';
import 'package:e_commerce/features/signup_screen/data/repositories/sign_up_impl.dart';
import 'package:e_commerce/features/signup_screen/domain/repositories/signup_repo.dart';
import 'package:e_commerce/features/signup_screen/domain/use_cases/signup_use_case.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  UserEntity? userEntity;
  String? error;
  Future<void> postUserAccount(String name , String email , String password,String rePassword,String phone) async{
    emit(SignupLoading());
    ApiManager apiManager = ApiManager();
    SignupRemoteDs signupRemoteDs = SignupRemoteDsImpl(apiManager);
    SignupRepo signupRepo = SignUpRepoImpl(signupRemoteDs);
    SignupUseCase signupUseCase = SignupUseCase(signupRepo);
    var result = await signupUseCase.call(email, name, password,rePassword,phone);
    result.fold((l){
      error = l.errorMessage;
      emit(SignupFail());
      print(state);
    }, (r){
      userEntity = r;
      emit(SignupSuccess());
      print(state);
    },);
  }
}
