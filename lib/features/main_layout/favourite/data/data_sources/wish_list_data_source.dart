
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';


abstract class GetWishListDS{

  Future<WashListModel> getWishList();
  Future<bool> deleteWishList(String id);
}