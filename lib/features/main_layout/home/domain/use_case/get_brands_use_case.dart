

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repo/home_Repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/faliures/faliures.dart';
import '../../data/models/BrandsModel.dart';

@injectable
class GetBrandsUSeCase{

  HomeRepo homeRepo;
  GetBrandsUSeCase(this.homeRepo);

  Future<Either<RouteFailures, BrandsModel>> call()=>homeRepo.getBrandsData();

}