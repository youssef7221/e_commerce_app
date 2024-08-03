import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class AppFonts{
  static  TextStyle semiBoldFont = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500
  );

  static  TextStyle buttonFont = GoogleFonts.montserrat(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    color: Colors.white
  );
static TextStyle extraBold = GoogleFonts.montserrat(
  fontSize: 24.sp,
  fontWeight: FontWeight.w800,
);
}