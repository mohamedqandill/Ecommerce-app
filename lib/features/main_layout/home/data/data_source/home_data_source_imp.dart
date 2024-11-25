
import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/BrandsModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/end_points.dart';
import '../models/CategoryModel.dart';
import 'home_data_source.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource{
  // ApiManager apiManager;
  // GetCategoryDataSourceImpl(this.apiManager);

  @override
  Future<CategoryModel> getCategoryData() async{
    try{
      var response = await getIt<ApiManager>().getData(endPoints: EndPoints.category);

      CategoryModel categoryModel=CategoryModel.fromJson(response.data);
      return categoryModel;

    }catch(e){
      rethrow;

    }
  }

  @override
  Future<BrandsModel> getBrandsData() async{
    try{
      var response = await getIt<ApiManager>().getData(endPoints: EndPoints.brands);

      BrandsModel brandsModel=BrandsModel.fromJson(response.data);
      return brandsModel;

    }catch(e){
      rethrow;

    }
  }
  
}