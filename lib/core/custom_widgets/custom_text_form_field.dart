import 'package:e_commerce/core/password_cubit/password_cubit.dart';
import 'package:e_commerce/core/utills/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isObscure = context.watch<PasswordCubit>().isObscure;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText ? isObscure : false,
        cursorColor: AppColors.blackColor,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<PasswordCubit>().changePassVis();
                    },
                  )
                : null,
            fillColor: AppColors.textField,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorder),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
