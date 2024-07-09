import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen({super.key , required this.imageUrl,required this.text});
  final String imageUrl ;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 240.h,
              child: Image.asset(imageUrl)),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(text , style: AppFonts.extraBold,),
      ],
    );
  }
}
