
import 'package:e_commerce/features/home_screen/data/models/ProductsDm.dart';
import 'package:e_commerce/features/home_screen/domain/entities/CategoriesEntity.dart';
import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';

abstract class HomeRepo {
  Future<Either<Failure,CategoriesEntity>> getCategories();
  Future<Either<Failure,ProductsDm>> getProducts(Map<String, dynamic> data);

}