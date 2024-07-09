import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/features/onBoarding/presentation/manager/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnBoardingCubit(),)
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.onboarding,
              onGenerateRoute: (settings) => Routes.onGenerate(settings),
            ),
          );
        }
    );
  }


}
