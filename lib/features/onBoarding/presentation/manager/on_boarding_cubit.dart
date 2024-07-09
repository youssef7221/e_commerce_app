import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  final controller = PageController();

  int index = 1;


  void change(int value){
    index = value+1;
   emit(OnBoardingChange());
  }


  bool prevVisibilty(){
    if(index == 1) {
      return false;
    } else {
      return true;
    }
  }
  void buttonChange(String buttonType){
    if(buttonType == "Next" && index < 3)
      {
        index++;
        controller.jumpToPage(index-1);
        emit(OnBoardingChange());
      }
    if(buttonType == "Prev" && index > 1)
    {
      index--;
      controller.jumpToPage(index-1);
      emit(OnBoardingChange());
    }
  }
}
