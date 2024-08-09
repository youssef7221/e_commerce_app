import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/core/utills/app_images.dart';
import 'package:e_commerce/core/utills/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdPhotoWidget extends StatelessWidget {
  const AdPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        children: [
          Image.asset(AppImages.adPhoto),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
            child: Text(AppString.bigMall,style: AppFonts.buttonFont.copyWith(
              fontSize: 24
            ),),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical :60.h,horizontal: 20.w),
            child: SizedBox(
              width: 150.w,
                child: Text(AppString.smallPhone,style: AppFonts.buttonFont,)),
          )
        ],
      ),
    );
  }
}
