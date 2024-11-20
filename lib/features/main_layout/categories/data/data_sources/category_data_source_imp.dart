

import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';

@Injectable(as: GetSubCategoryDS)
class GetSubCategoryDSImp implements GetSubCategoryDS{
  @override
  Future<CategoryModel> getSubCategory(String id) async{

    try{
      var response=await getIt<ApiManager>().getData(endPoints: EndPoints.category+"/$id/subcategories");

      CategoryModel categoryModel=CategoryModel.fromJson(response.data);
      return categoryModel;

    }catch(e){
      rethrow;

    }
  }

}