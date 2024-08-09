import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySafeArea extends StatelessWidget {
  Widget widget;

  MySafeArea({required this.widget , super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 35.h),
    child: widget,);
  }
}
