import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/faliures/faliures.dart';
import '../../../home/data/models/CategoryModel.dart';

@injectable
class GetSubCategoryUseCase{
  GetSubCategoryRepo getSubCategoryRepo;
  GetSubCategoryUseCase(this.getSubCategoryRepo);

  Future<Either<RouteFailures, CategoryModel>> call(String id)=>getSubCategoryRepo.getSubCategory(id);



}