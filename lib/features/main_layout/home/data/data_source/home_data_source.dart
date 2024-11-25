


import 'package:ecommerce_app/features/main_layout/home/data/models/BrandsModel.dart';

import '../models/CategoryModel.dart';

abstract class HomeDataSource{

  Future<CategoryModel> getCategoryData();
  Future<BrandsModel> getBrandsData();
}