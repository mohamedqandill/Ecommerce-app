
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';

import '../models/AddToCartModel.dart';

abstract class GetProductDetailsDS{

  Future<AddToCartModel> addToCart(String prodId);
}