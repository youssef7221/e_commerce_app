import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/core/utills/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utills/app_color.dart';
import '../manager/on_boarding_cubit.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            visible: context.read<OnBoardingCubit>().prevVisibilty(),
            child: GestureDetector(
            onTap: ()=>context.read<OnBoardingCubit>().buttonChange("Prev"),
              child: Text(AppString.previous,style: AppFonts.semiBoldFont.copyWith(
                  color: AppColors.blackColor
              ),),
            ),
          ),
          SmoothPageIndicator(
              controller: context.read<OnBoardingCubit>().controller,
              count:3,
              effect: const ScrollingDotsEffect(
                  activeDotColor: AppColors.blackColor
              )
          ),
         context.read<OnBoardingCubit>().index < 3 ? GestureDetector(
            onTap: ()=>context.read<OnBoardingCubit>().buttonChange("Next"),
            child: Text(AppString.next,style: AppFonts.semiBoldFont.copyWith(
              color: AppColors.buttonColor
            ),),
          ) : GestureDetector(
           onTap: ()=> Navigator.pushNamed(context , AppRoutes.login),
            child: Text(AppString.start,style: AppFonts.semiBoldFont.copyWith(
               color: AppColors.buttonColor
                     ),),
          ),
        ],
      ),
    );
  }
}
