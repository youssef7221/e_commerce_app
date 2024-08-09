import 'package:e_commerce/core/custom_widgets/custom_text_field.dart';
import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/core/utills/app_string.dart';
import 'package:e_commerce/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/home_tab_widgets/ad_photo_widget.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/home_tab_widgets/categories_list.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/home_tab_widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utills/app_color.dart';
import '../../widgets/home_tab_widgets/app_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return Column(
            children: [
              const MyAppBar(),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                hintText: AppString.search,
                textEditingController: textEditingController,
                icon: const Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.search,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppString.categories,
                      style: AppFonts.extraBold,
                    ),
                    const Spacer(),
                    Text(
                      AppString.viewAll,
                      style: AppFonts.searchFont
                          .copyWith(color: AppColors.buttonColor),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              (context.watch<HomeScreenCubit>().categoriesEntity == null)
                  ? SizedBox(
                      height: 120.h,
                      width: ScreenUtil.defaultSize.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.buttonColor,
                      )))
                  : const CategoriesList(),
              const AdPhotoWidget(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppString.topRating,
                      style: AppFonts.extraBold,
                    ),
                  ],
                ),
              ),
              (context.watch<HomeScreenCubit>().productsDm == null)
                  ? SizedBox(
                      height: 120.h,
                      width: ScreenUtil.defaultSize.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.buttonColor,
                      )))
                  : ProductCard()
            ],
          );
        },
      ),
    );
  }
}
