import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/features/login_screen/data/remote/data_sources/signin_remote_ds.dart';
import 'package:e_commerce/features/login_screen/data/remote/data_sources/signin_remote_ds_impl.dart';
import 'package:e_commerce/features/login_screen/data/repositories/signin_repo_impl.dart';
import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/login_screen/domain/repositories/signin_repo.dart';
import 'package:e_commerce/features/login_screen/domain/use_cases/login_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());
  String? error;
  UserEntity? userEntity;

  Future<void> postUser(String email , String password)async{
    emit(LoginScreenLoading());
    ApiManager apiManager = ApiManager();
    SigninRemoteDs signinRemoteDs = SigninRemoteDsImpl(apiManager);
    SignInRepo signInRepo = SigninRepoImpl(signinRemoteDs);
    SignInUseCase signInUseCase = SignInUseCase(signInRepo);
    var result = await signInUseCase.call(email, password);
    result.fold((l){
      error = l.errorMessage;
      emit(LoginScreenFailed());
      print(state);
    }, (r) {
      userEntity = r;
      emit(LoginScreenSuccess());
      print(state);
    });
  }
}
