


import '../models/CategoryModel.dart';

abstract class GetCategoryDataSource{

  Future<CategoryModel> getCategoryData();
}