import 'package:e_commerce/core/services/app_exception.dart';
import 'package:e_commerce/features/home_screen/data/data_sources/home_ds.dart';
import 'package:e_commerce/features/home_screen/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:either_dart/src/either.dart';

import '../models/ProductsDm.dart';

class HomeRepoImpl extends HomeRepo {
  HomeDs homeDs;

  HomeRepoImpl(this.homeDs);

  @override
  Future<Either<Failure, CategoriesEntity>> getCategories() {
    return homeDs.getCategories();
  }
  @override
  Future<Either<Failure,ProductsDm>> getProducts(Map<String, dynamic> data){
   return homeDs.getProducts(data);
  }


}