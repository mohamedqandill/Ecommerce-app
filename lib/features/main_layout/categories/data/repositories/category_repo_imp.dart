

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repo/home_Repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetSubCategoryRepo)
class GetSubCategoryRepoImp implements GetSubCategoryRepo{
  GetSubCategoryDS getSubCategoryDS;
  GetSubCategoryRepoImp(this.getSubCategoryDS);

  @override
  Future<Either<RouteFailures, CategoryModel>> getSubCategory(String id) async{
    try{
      var data=await getSubCategoryDS.getSubCategory(id);
      return Right(data);

    }
    catch(e){
      throw Left(e.toString());
    }
  }


}