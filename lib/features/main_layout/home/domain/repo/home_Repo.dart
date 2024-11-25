
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/BrandsModel.dart';

import '../../data/models/CategoryModel.dart';

abstract class HomeRepo{

  Future<Either<RouteFailures,CategoryModel>> getCategoryData();
  Future<Either<RouteFailures,BrandsModel>> getBrandsData();
}