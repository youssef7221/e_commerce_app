import 'package:e_commerce/features/home_screen/data/models/CategoriesDm.dart';
import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';
import '../models/ProductsDm.dart';

abstract class HomeDs {
  Future<Either<Failure,CategoriesDm>> getCategories();
  Future<Either<Failure,ProductsDm>> getProducts(Map<String, dynamic> data);


}