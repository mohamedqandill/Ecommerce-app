


import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/wash_list_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetWishListRepo)
class GetWishListRepoImpl implements GetWishListRepo{
  GetWishListDS getWashListDS;
  GetWishListRepoImpl(this.getWashListDS);
  @override
  Future<Either<RouteFailures, WashListModel>> getWishList()async {
    try{
      var data=await getWashListDS.getWishList();
      return Right(data);
    }
    catch(e){
      throw Left(RouteRemoteFailures(e.toString()));

    }
  }

  @override
  Future<Either<RouteFailures, bool>> deleteWishList(String id) async{
    try{
      var data=await getWashListDS.deleteWishList(id);
      return Right(data);
    }
    catch(e){
      return Left(RouteRemoteFailures(e.toString()));

    }
  }

}