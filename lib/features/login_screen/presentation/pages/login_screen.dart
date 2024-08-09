import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/custom_widgets/custom_button.dart';
import 'package:e_commerce/core/custom_widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/screen_safe_area/my_safe_area.dart';
import 'package:e_commerce/core/utills/validators.dart';
import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/features/login_screen/presentation/manager/login_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utills/app_color.dart';
import '../../../../core/utills/app_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MySafeArea(
      widget:
      Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
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
                        width: 200.w,
                        height: 100.h,
                        child: Text(
                          AppString.welcomeBack,
                          style: AppFonts.extraBold.copyWith(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
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
                      hintText: "Enter Your Password",
                      prefixIcon: const Icon(Icons.lock),
                      controller: passController,
                      validator: Validators.passwordValidate,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30.w, top: 9.h),
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        AppString.passForget,
                        textAlign: TextAlign.end,
                        style: AppFonts.semiBoldFont.copyWith(
                          color: AppColors.buttonColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                      text: "Login",
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                           context.read<LoginScreenCubit>().postUser(
                              emailController.text,passController.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.dontAccount,
                          style: AppFonts.semiBoldFont.copyWith(
                              color: AppColors.smallTextColor, fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signUp);
                          },
                          child: Text(
                            AppString.sign,
                            style: AppFonts.semiBoldFont.copyWith(
                              color: AppColors.buttonColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.buttonColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
                listener: (context, state) {
                  if (state is LoginScreenLoading){
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
                  }
                  if (state is LoginScreenSuccess) {
                    Navigator.pop(context); // Dismiss the loading dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: SizedBox(
                            height: 100.h,
                              child: Text(context.read<LoginScreenCubit>().userEntity?.user?.name ?? "Success")),
                        );
                      },
                    );
                  }

                  if (state is LoginScreenFailed) {
                    Navigator.pop(context); // Dismiss the loading dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: SizedBox(
                            height: 75.h,
                              child: Text(context.read<LoginScreenCubit>().error ?? "Error")),
                        );
                      },
                    );
                  }
                },
            ),
          ),
        ),
      ),
    );
  }
}
