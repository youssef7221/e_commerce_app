import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:either_dart/either.dart';

import '../../../../core/services/app_exception.dart';
import '../entities/CategoriesEntity.dart';

class CategoriesUseCase {
 HomeRepo homeRepo;
 CategoriesUseCase(this.homeRepo);
 Future<Either<Failure,CategoriesEntity>> call(){
  return homeRepo.getCategories();
  }
}