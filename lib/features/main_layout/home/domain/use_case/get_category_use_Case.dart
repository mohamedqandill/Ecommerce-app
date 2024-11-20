

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/faliures/faliures.dart';
import '../../data/models/CategoryModel.dart';
import '../repo/home_Repo.dart';

@injectable
class GetCategoryUseCase{
  GetCategoryRepo getCategoryRepo;
  GetCategoryUseCase(this.getCategoryRepo);

  Future<Either<RouteFailures, CategoryModel>> call()=>getCategoryRepo.getCategoryData();

}