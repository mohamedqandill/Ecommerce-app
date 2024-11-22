


import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';

@Injectable(as:GetWashListDS )
class GetWashListDSImpl implements GetWashListDS{
  @override
  Future<WashListModel> getWashList()async {
   try{
     String? token=CacheHelper.getData<String>("token");
     var response=await getIt<ApiManager>().getData(endPoints: EndPoints.addToWishList,headers: {
       "token":token
     });
     WashListModel washListModel=WashListModel.fromJson(response.data);
     return washListModel;
   }
   catch(e){
     rethrow;
   }

  }
  
}