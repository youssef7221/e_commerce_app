import 'package:e_commerce/features/login_screen/presentation/pages/login_screen.dart';
import 'package:e_commerce/features/onBoarding/presentation/pages/onboarding_screen.dart';
import 'package:e_commerce/features/signup_screen/presentation/pages/signup_screen.dart';
 import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = "/";
  static const String onboarding = "/onBoardingScreen";
  static const String signUp= "/signUpScreen";

}

class Routes{
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name){
      case(AppRoutes.onboarding):
        return MaterialPageRoute(builder: (context) => const OnboardingScreen(),);
      case(AppRoutes.login):
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      case(AppRoutes.signUp):
        return MaterialPageRoute(builder: (context) => const SignupScreen(),);
      default :
        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(
              title:const Text("No Routes",)
          ),
        ),);
    }

  }
}