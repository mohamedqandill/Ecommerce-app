
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';

abstract class GetSubCategoryRepo{


  Future<Either<RouteFailures,CategoryModel>> getSubCategory(String id);
}