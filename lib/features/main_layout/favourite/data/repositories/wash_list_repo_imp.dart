


import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/wash_list_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetWashListRepo)
class GetWashListRepoImpl implements GetWashListRepo{
  GetWashListDS getWashListDS;
  GetWashListRepoImpl(this.getWashListDS);
  @override
  Future<Either<RouteFailures, WashListModel>> getWashList()async {
    try{
      var data=await getWashListDS.getWashList();
      return Right(data);
    }
    catch(e){
      throw Left(RouteRemoteFailures(e.toString()));

    }
  }

}