import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';

@Injectable(as: GetWishListDS)
class GetWishListDSImpl implements GetWishListDS {
  @override
  Future<WashListModel> getWishList() async {
    try {
      String? token = CacheHelper.getData<String>("token");
      var response = await getIt<ApiManager>().getData(
          endPoints: EndPoints.addToWishList, headers: {
        "token": token
      });
      WashListModel washListModel = WashListModel.fromJson(response.data);
      return washListModel;
    }
    catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteWishList(String id) async {
    try {
      String? token = CacheHelper.getData<String>("token");

      var response = await getIt<ApiManager>().deleteData(
        headers: {
          "token":token
        },
          endPoints: EndPoints.addToWishList+"/"+id);
      if(response.statusCode==200){
        return true;
      }
      return false;
    } catch (e) {
      rethrow;

    }
  }

}