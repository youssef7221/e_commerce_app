import 'package:e_commerce/core/services/app_exception.dart';
import 'package:e_commerce/features/home_screen/data/models/ProductsDm.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:either_dart/either.dart';

class ProductsUseCase {
  HomeRepo homeRepo;

  ProductsUseCase(this.homeRepo);

  Future<Either<Failure,ProductsDm>> call(Map<String, dynamic> data){
   return homeRepo.getProducts(data);
  }
}