
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/product_details/data/models/AddToCartModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';

abstract class GetProductDetailsRepo{


  Future<Either<RouteFailures,AddToCartModel>> addToCart(String prodId);
}