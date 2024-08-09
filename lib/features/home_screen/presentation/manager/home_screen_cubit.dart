import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/features/home_screen/data/data_sources/home_ds.dart';
import 'package:e_commerce/features/home_screen/data/data_sources/home_ds_impl.dart';
import 'package:e_commerce/features/home_screen/data/models/ProductsDm.dart';
import 'package:e_commerce/features/home_screen/data/repositories/home_repo_impl.dart';
import 'package:e_commerce/features/home_screen/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:e_commerce/features/home_screen/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/features/home_screen/domain/use_cases/products_use_case.dart';
import 'package:e_commerce/features/home_screen/presentation/pages/tabs/categories_tab.dart';
import 'package:e_commerce/features/home_screen/presentation/pages/tabs/favourites_tab.dart';
import 'package:e_commerce/features/home_screen/presentation/pages/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import '../pages/tabs/home_tab.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(
      HomeScreenInitial()){
    getCategories();
    getProducts({'sort':'-ratingsAverage'});
    }

  int currentBottomNavIndex = 0;
  List<Widget> tabs = const[
    HomeTab(),
    CategoriesTab(),
    FavouritesTab(),
    ProfileTab()
  ];

  void changeBottomNav(index){
  currentBottomNavIndex = index;
  emit(ChangeBottomNavIndex());
  }
  String? errorCat;
  CategoriesEntity? categoriesEntity;
  Future<void> getCategories()async{
    emit(LoadingState());
    ApiManager apiManager = ApiManager();
    HomeDs homeDs = HomeDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(homeDs);
    CategoriesUseCase categoriesUseCase = CategoriesUseCase(homeRepo);
    var result = await categoriesUseCase.call();
    result.fold((l){
      errorCat = l.errorMessage;
      emit(FailedGetCategories());
    }, (r) {
      categoriesEntity = r;
      emit(SuccessGetCategories());
    },);
}

String? errorProduct;
  ProductsDm? productsDm;

Future<void> getProducts(Map<String, dynamic> data) async{
  emit(LoadingState());
    ApiManager apiManager = ApiManager();
    HomeDs homeDs = HomeDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(homeDs);
    ProductsUseCase productsUseCase = ProductsUseCase(homeRepo);
    var result = await productsUseCase.call(data);
    result.fold((l){
      errorProduct = l.errorMessage;
      emit(FailedGetProducts());
    }, (r) {
      productsDm = r;
      emit(SuccessGetProducts());
    });
}
}
