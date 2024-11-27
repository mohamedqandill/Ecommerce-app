

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
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

import '../data_sources/cart_data_source.dart';
@Injectable(as: GetCartRepo)
class GetCartRepoImp implements GetCartRepo{
  GetCartDS getCartDS;

  GetCartRepoImp(this.getCartDS);

  @override
  Future<Either<RouteFailures, GetCartModel>> getCart() async{
    try{
      var data=await getCartDS.getCart();
      return Right(data);

    }
    catch(e){
      throw Left(e.toString());
    }
  }

  @override
  Future<Either<RouteFailures, bool>> deleteCart()async {
    try{
      var data=await getCartDS.deleteCart();
      return Right(data);

    }
    catch(e){
      throw Left(e.toString());
    }
  }







}