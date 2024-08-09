import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utills/app_color.dart';
import 'package:e_commerce/core/utills/app_fonts.dart';
import 'package:e_commerce/core/utills/app_images.dart';
import 'package:e_commerce/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utills/app_string.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    var productsDm = context.watch<HomeScreenCubit>().productsDm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              width: 180.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.buttonColor, width: 0.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      imageUrl: productsDm?.data?[index].images?[0] ?? "",
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return SizedBox(
                          width: 180.w,
                          height: 120.h,
                        );
                      },
                      width: 200.w,
                      height: 120.h,
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      productsDm!.data![index].title ??
                          AppString.somethingWrong,
                      style: AppFonts.productsFont,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          productsDm.data![index].brand?.name ??
                              AppString.somethingWrong,
                          style: AppFonts.productsFont
                              .copyWith(color: AppColors.search),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "${productsDm.data?[index].price} LE",
                      style: AppFonts.productsFont.copyWith(fontSize: 20.sp),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                            "Review (${productsDm.data?[index].ratingsAverage})",
                            style: AppFonts.productsFont),
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      Image.asset(
                        AppImages.star,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
