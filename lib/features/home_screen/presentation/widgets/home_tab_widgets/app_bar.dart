import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/core/utills/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utills/app_color.dart';
import '../../../../../core/utills/app_string.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image.asset(AppImages.logo,height: 50.h,width: 50.w,),
        SizedBox(width: 5.w,),
        Text(AppString.appName,style: AppFonts.logoFont,)
      ],
    );
  }
}
