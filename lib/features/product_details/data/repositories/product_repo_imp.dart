

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repo/home_Repo.dart';
import 'package:ecommerce_app/features/product_details/data/models/AddToCartModel.dart';
import 'package:ecommerce_app/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/product_details_data_source.dart';
@Injectable(as: GetProductDetailsRepo)
class GetProductDetailsRepoImp implements GetProductDetailsRepo{
  GetProductDetailsDS getProductDetailsDS;

  GetProductDetailsRepoImp(this.getProductDetailsDS);

  @override
  Future<Either<RouteFailures, AddToCartModel>> addToCart(String prodId) async{
    try{
      var data=await getProductDetailsDS.addToCart(prodId);
      return Right(data);

    }
    catch(e){
      throw Left(e.toString());
    }
  }





}