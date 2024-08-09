part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class ChangeBottomNavIndex extends HomeScreenState {}
final class LoadingState extends HomeScreenState {}
final class SuccessGetCategories extends HomeScreenState {}
final class FailedGetCategories extends HomeScreenState {}
final class SuccessGetProducts extends HomeScreenState {}
final class FailedGetProducts extends HomeScreenState {}

