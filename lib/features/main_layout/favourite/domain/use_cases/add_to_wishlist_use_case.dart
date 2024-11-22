


import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repositories/wash_list_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/faliures/faliures.dart';
import '../../data/models/WashListModel.dart';

@injectable
class GetWashListUseCase{

  GetWashListRepo getWashListRepo;
  GetWashListUseCase(this.getWashListRepo);

  Future<Either<RouteFailures, WashListModel>> call()=>getWashListRepo.getWashList();
}