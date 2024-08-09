import 'package:e_commerce/core/utills/app_color.dart';
import 'package:e_commerce/core/utills/app_string.dart';
import 'package:e_commerce/features/home_screen/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
   CategoriesEntity? categories = context.watch<HomeScreenCubit>().categoriesEntity;
    return SizedBox(
      height: 120.h,
      width: ScreenUtil.defaultSize.width,
      child: ListView.builder(
        itemCount: categories?.data?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipOval(
                  child:SizedBox(
                    width: 65.w,
                    height: 65.h,
                    child:  CachedNetworkImage(imageUrl:categories?.data?[index].image??"",
                      fit: BoxFit.fill,
                      height: 65.h,
                      width: 65.w,
                      errorWidget:( context, url, error){
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(categories
                        ?.data![index]
                        .name ??
                    AppString.somethingWrong)
              ],
            ),
          );
        },
      ),
    );
  }
}
