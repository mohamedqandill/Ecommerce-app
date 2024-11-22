
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';

abstract class GetProductRepo{


  Future<Either<RouteFailures,ProductModel>> getProduct(String id);
  Future<Either<RouteFailures,bool>> addToWishList(String prodId);
}