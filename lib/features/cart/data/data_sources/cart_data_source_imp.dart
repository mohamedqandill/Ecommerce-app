import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/product_details/data/data_sources/product_details_data_source.dart';
import 'package:ecommerce_app/features/product_details/data/models/AddToCartModel.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import 'cart_data_source.dart';

@Injectable(as: GetCartDS)
class GetCartDSImp implements GetCartDS {
  @override
  Future<GetCartModel> getCart()async {

    String? token=CacheHelper.getData<String>("token");
    print("tooooooooooooooooooken $token");
    print(token);
    try {
      var response = await getIt<ApiManager>()
          .getData(endPoints: EndPoints.addToCart,
          headers: {
            "token":token
          }
      );

      GetCartModel getCartModel = GetCartModel.fromJson(response.data);
      print(response.data);
      print(response.data);
      return getCartModel;
    } catch (e) {
      rethrow;
    }
  }


}
