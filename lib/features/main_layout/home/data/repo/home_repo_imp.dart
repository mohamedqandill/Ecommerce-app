

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/BrandsModel.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_Repo.dart';
import '../data_source/home_data_source.dart';
import '../models/CategoryModel.dart';

@Injectable(as:HomeRepo )
class HomeRepoImp implements HomeRepo{
  HomeDataSource getCategoryDataSource;
  HomeRepoImp(this.getCategoryDataSource);


  @override
  Future<Either<RouteFailures, CategoryModel>> getCategoryData()async {
    try{
      var data=await getCategoryDataSource.getCategoryData();
     return Right(data);
    }catch(e){
      return Left(RouteRemoteFailures(e.toString()));
    }


  }

  @override
  Future<Either<RouteFailures, BrandsModel>> getBrandsData() async{
    try{
      var data=await getCategoryDataSource.getBrandsData();
      return Right(data);
    }catch(e){
      return Left(RouteRemoteFailures(e.toString()));
    }
  }


}