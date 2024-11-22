

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repo/home_Repo.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetProductRepo)
class GetProductRepoImp implements GetProductRepo{
  GetProductDS getProductDS;

  GetProductRepoImp(this.getProductDS);

  @override
  Future<Either<RouteFailures, ProductModel>> getProduct(String id) async{
    try{
      var data=await getProductDS.getProduct(id);
      return Right(data);

    }
    catch(e){
      throw Left(e.toString());
    }
  }

  @override
  Future<Either<RouteFailures, bool>> addToWishList(String prodId)async {
    try{
      bool data=await getProductDS.addToWishList(prodId);
      return Right(data);

    }
    catch(e){
    throw  Left(RouteRemoteFailures(e.toString()));

    }
  }




}