import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utills/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    required this.textEditingController,
    required this.hintText,
    required this.icon});

 final TextEditingController textEditingController;
 final String hintText;
 final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.searchFont,
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.search,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.search,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}