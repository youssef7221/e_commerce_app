part of 'login_screen_cubit.dart';

@immutable
sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState{}
final class LoginScreenSuccess extends LoginScreenState{}
final class LoginScreenFailed extends LoginScreenState{}


