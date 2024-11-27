
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';


abstract class GetCartDS{

  Future<GetCartModel> getCart();
  Future<bool> deleteCart();
}