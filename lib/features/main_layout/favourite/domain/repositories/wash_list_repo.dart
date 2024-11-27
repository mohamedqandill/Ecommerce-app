

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';

abstract class GetWishListRepo{


  Future<Either<RouteFailures,WashListModel>> getWishList();
  Future<Either<RouteFailures,bool>> deleteWishList(String id);
}