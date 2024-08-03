import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/custom_widgets/custom_button.dart';
import 'package:e_commerce/core/custom_widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/screen_safe_area/my_safe_area.dart';
import 'package:e_commerce/core/utills/validators.dart';
import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/features/signup_screen/presentation/manager/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utills/app_color.dart';
import '../../../../core/utills/app_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MySafeArea(
      Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                switch(state) {
                  case SignupLoading():
                    showDialog(
                      context: context,
                      builder: (context){
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.buttonColor,
                          ),
                        );
                      },
                    );
                  case SignupSuccess():
                    Navigator.pop(context); // Dismiss the loading dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: SizedBox(
                              height: 200.h,
                              child: Text(context.read<SignupCubit>().userEntity?.user?.name ?? "Success")),
                        );
                      },
                    );
                  case SignupFail():
                    Navigator.pop(context); // Dismiss the loading dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: SizedBox(
                              height: 200.h,
                              child: Text(context.read<SignupCubit>().error ?? "Error")),
                        );
                      },
                    );
                  default:
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SizedBox(
                        width: 300.w,
                        height: 100.h,
                        child: Text(
                          AppString.createAcc,
                          style: AppFonts.extraBold
                              .copyWith(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter Your Name",
                      prefixIcon: const Icon(Icons.person),
                      controller: nameController,
                      validator: Validators.nameValidate,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter Your Email",
                      prefixIcon: const Icon(Icons.person),
                      controller: emailController,
                      validator: Validators.emailValidate,
                      keyboardType: TextInputType.text,

                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter Your Phone Number",
                      prefixIcon: const Icon(Icons.phone_android_rounded),
                      controller: phoneController,
                      validator: Validators.validatePhone,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      hintText: "Enter Your password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: Icons.visibility,
                      obscureText: true,
                      controller: passController,
                      validator: Validators.passwordValidate,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      hintText: "Confirm Your password",
                      prefixIcon: const Icon(Icons.lock),
                      controller: confirmPassController,
                      validator:
                          (value) =>
                          Validators.confirmPasswordValidate(
                              value, passController.text),
                      keyboardType: TextInputType.text,

                    ),
                    SizedBox(height: 30.h,),
                    CustomButton(text: "Create Account",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupCubit>().postUserAccount(
                              nameController.text,
                              emailController.text,
                              passController.text,
                          confirmPassController.text,
                          phoneController.text);
                        }
                      },),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppString.dontAccount,
                          style: AppFonts.semiBoldFont.copyWith(
                              color: AppColors.smallTextColor,
                              fontSize: 14.sp
                          ),),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Text(AppString.login,
                            style: AppFonts.semiBoldFont.copyWith(
                              color: AppColors.buttonColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.buttonColor,
                            ),),
                        )
                      ],
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
