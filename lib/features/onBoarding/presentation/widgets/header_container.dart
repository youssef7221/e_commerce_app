import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utills/app_color.dart';
import '../../../../core/utills/app_fonts.dart';
import '../../../../core/utills/app_string.dart';
import '../manager/on_boarding_cubit.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.w,
      ),
      height: 40.h,
      child: Row(
        children: [
          Text(
            "${context.read<OnBoardingCubit>().index}/3",
            style: AppFonts.semiBoldFont,
          ),
          const Spacer(),
          context.read<OnBoardingCubit>().index < 3
              ? TextButton(
                  child: Center(
                    child: Text(
                      AppString.skip,
                      style: AppFonts.semiBoldFont
                          .copyWith(color: AppColors.blackColor),
                    ),
                  ),
                  onPressed: () {
                    context.read<OnBoardingCubit>().controller.jumpToPage(2);
                  },
                )
              : const Text("")
        ],
      ),
    );
  }
}
