import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api_endpoints.dart';
import 'package:e_commerce/core/services/api_manager.dart';
import 'package:e_commerce/core/services/app_exception.dart';
import 'package:e_commerce/features/home_screen/data/data_sources/home_ds.dart';
import 'package:e_commerce/features/home_screen/data/models/CategoriesDm.dart';
import 'package:either_dart/src/either.dart';
import '../models/ProductsDm.dart';

class HomeDsImpl implements HomeDs {
  ApiManager apiManager;

  HomeDsImpl(this.apiManager);

  @override
  Future<Either<Failure, CategoriesDm>> getCategories() async{
    try{
      var response =await apiManager.get(ApiEndpoints.categories, {});
      CategoriesDm categoriesDm = CategoriesDm.fromJson(response.data);
      return Right(categoriesDm);
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure,ProductsDm>> getProducts(Map<String, dynamic> data)async{
   try {
     var response = await apiManager.get(ApiEndpoints.product,data);
     ProductsDm productsDm = ProductsDm.fromJson(response.data);
     return Right(productsDm);
   }
   on DioException catch (e) {
     return Left(ServerFailure.fromDioError(e));
   } catch (e) {
     return Left(ServerFailure(e.toString()));
   }
  }

}