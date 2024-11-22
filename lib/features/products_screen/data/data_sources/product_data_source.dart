
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';

abstract class GetProductDS{

  Future<ProductModel> getProduct(String id);
  Future<bool> addToWishList(String prodId);
}