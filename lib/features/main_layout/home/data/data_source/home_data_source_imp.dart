
import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/end_points.dart';
import '../models/CategoryModel.dart';
import 'home_data_source.dart';

@Injectable(as: GetCategoryDataSource)
class GetCategoryDataSourceImpl implements GetCategoryDataSource{
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
  
}