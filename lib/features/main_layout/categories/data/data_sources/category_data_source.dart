
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';

abstract class GetSubCategoryDS{

  Future<CategoryModel> getSubCategory(String id);
}