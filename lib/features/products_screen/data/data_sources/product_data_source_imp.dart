import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';

@Injectable(as: GetProductDS)
class GetProductDSImp implements GetProductDS {
  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      var response = await getIt<ApiManager>()
          .getData(endPoints: EndPoints.products,params: {
            "category[in]":id
      });

      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addToWishList(String prodId) async{
    String? token=CacheHelper.getData<String>("token");
    try{
      var response= await getIt<ApiManager>().postData(endPoints: EndPoints.addToWishList,body: {
        "productId":prodId
      },
        headers: {
        "token":token
        }

      );
      if(response.statusCode==200){
        return true;
      }
      return false;
    }
    catch(e){
      rethrow;

    }
  }
}
