import 'package:e_commerce/core/utills/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class AppFonts{
  static  TextStyle semiBoldFont = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500
  );
  static  TextStyle productsFont = GoogleFonts.montserrat(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400
  );

  static  TextStyle searchFont = GoogleFonts.montserrat(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    color: AppColors.search,
  );

  static  TextStyle buttonFont = GoogleFonts.montserrat(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    color: Colors.white
  );
static TextStyle extraBold = GoogleFonts.montserrat(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
);


  static TextStyle logoFont = GoogleFonts.scheherazadeNew(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.logoColor
  );
}