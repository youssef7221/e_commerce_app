import 'package:e_commerce/core/utills/app_color.dart';
import 'package:e_commerce/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/screen_safe_area/my_safe_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = context.watch<HomeScreenCubit>().tabs;
    int currentIndex = context.read<HomeScreenCubit>().currentBottomNavIndex;
    return Scaffold(
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
  builder: (context, state) {
    print(state);
    return MySafeArea(widget: tab[currentIndex],);
  },
),
      bottomNavigationBar:Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.buttonColor
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r)
          ),
          child: BottomNavigationBar(items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.widgets_outlined),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "",),
          ],
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,
            unselectedItemColor: AppColors.blackColor,
            currentIndex: currentIndex,
            elevation: 0.0,
            onTap:context.read<HomeScreenCubit>().changeBottomNav,
          ),
        ),
      ),
    );
  }
}
