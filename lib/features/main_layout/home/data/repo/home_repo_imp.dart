

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_Repo.dart';
import '../data_source/home_data_source.dart';
import '../models/CategoryModel.dart';

@Injectable(as:GetCategoryRepo )
class GetCategoryRepoImp implements GetCategoryRepo{
  GetCategoryDataSource getCategoryDataSource;
  GetCategoryRepoImp(this.getCategoryDataSource);


  @override
  Future<Either<RouteFailures, CategoryModel>> getCategoryData()async {
    try{
      var data=await getCategoryDataSource.getCategoryData();
     return Right(data);
    }catch(e){
      return Left(RouteRemoteFailures(e.toString()));
    }


  }


}