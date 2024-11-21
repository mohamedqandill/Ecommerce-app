import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/product_details/data/data_sources/product_details_data_source.dart';
import 'package:ecommerce_app/features/product_details/data/models/AddToCartModel.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';

@Injectable(as: GetProductDetailsDS)
class GetProductDetailsDSImp implements GetProductDetailsDS {
  @override
  Future<AddToCartModel> addToCart(String prodId)async {
    print(CacheHelper.getData<String>("token"));
    print(CacheHelper.getData<String>("token"));
    try {
    var response = await getIt<ApiManager>()
        .postData(endPoints: EndPoints.addToCart,body: {
    "productId":prodId
    },
      headers: {
          'token':CacheHelper.getData<String>('token'),
      }
    );

    AddToCartModel addToCartModel = AddToCartModel.fromJson(response.data);
    return addToCartModel;
    } catch (e) {
    rethrow;
    }
  }

}
