import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utills/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed,
});
  final String text;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Container(
          height: 60.h,
          width: 317.w,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text(text,style: AppFonts.buttonFont,)),
        ),
      ),
    );
  }
}
