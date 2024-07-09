import 'package:e_commerce/core/screen_safe_area/my_safe_area.dart';
import 'package:e_commerce/core/utills/app_images.dart';
import 'package:e_commerce/core/utills/app_string.dart';
import 'package:e_commerce/features/onBoarding/presentation/manager/on_boarding_cubit.dart';
import 'package:e_commerce/features/onBoarding/presentation/widgets/footer_container.dart';
import 'package:e_commerce/features/onBoarding/presentation/widgets/header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buildscreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MySafeArea(
        BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            return Column(
              children: [
                HeaderContainer(),
                SizedBox(
                  height: 680.h,
                  child: PageView(
                    onPageChanged: context.read<OnBoardingCubit>().change,
                    controller: context.read<OnBoardingCubit>().controller,
                    children:const[
                       BuildScreen(imageUrl: AppImages.firstOnBoarding,
                      text: AppString.makePro,),
                      BuildScreen(imageUrl: AppImages.secondOnBoarding,
                      text:AppString.choosePro),
                      BuildScreen(imageUrl: AppImages.thirdOnBoarding,
                      text: AppString.getOrd,),
                    ],
                  ),
                ),
                FooterContainer()
              ],
            );
          },
        ),
      ),
    );
  }
}
