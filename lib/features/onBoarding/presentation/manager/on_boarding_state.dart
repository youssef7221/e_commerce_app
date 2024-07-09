part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingChange extends OnBoardingState {}

final class PrevVisibilty extends OnBoardingState {}

