
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';

import '../../data/models/CategoryModel.dart';

abstract class GetCategoryRepo{

  Future<Either<RouteFailures,CategoryModel>> getCategoryData();
}