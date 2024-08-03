import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/password_cubit/password_cubit.dart';
import 'package:e_commerce/core/shared_pref/shared_pref_helper.dart';
import 'package:e_commerce/features/login_screen/presentation/manager/login_screen_cubit.dart';
import 'package:e_commerce/features/onBoarding/presentation/manager/on_boarding_cubit.dart';
import 'package:e_commerce/features/signup_screen/presentation/manager/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  await sharedPreferencesHelper.init();
  bool showOnboarding = sharedPreferencesHelper.getBool("first") ?? false;
  runApp( MyApp(showOnboarding: showOnboarding,));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp({super.key,required this.showOnboarding});
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnBoardingCubit(),),
              BlocProvider(create: (context) => LoginScreenCubit(),),
              BlocProvider(create: (context) => PasswordCubit(),),
              BlocProvider(create: (context) => SignupCubit(),)
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute:showOnboarding ? AppRoutes.onboarding : AppRoutes.login,
              onGenerateRoute: (settings) => Routes.onGenerate(settings),
            ),
          );
        }
    );
  }


}
