import 'package:e_commerce/features/login_screen/presentation/pages/login_screen.dart';
import 'package:e_commerce/features/onBoarding/presentation/pages/onboarding_screen.dart';
import 'package:e_commerce/features/signup_screen/presentation/pages/signup_screen.dart';
 import 'package:flutter/material.dart';

import '../../features/home_screen/presentation/pages/home_screen.dart';

class AppRoutes {
  static const String login = "/";
  static const String onboarding = "/onBoardingScreen";
  static const String signUp= "/signUpScreen";
  static const String home = "/homeScreen";
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
      case(AppRoutes.home):
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);
      default :
        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(
              title:const Text("No Routes",)
          ),
        ),);
    }

  }
}