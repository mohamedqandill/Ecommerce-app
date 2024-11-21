import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/faliures/faliures.dart';
import '../../data/models/AddToCartModel.dart';

@injectable
class AddToCartUseCase {
  GetProductDetailsRepo getProductDetailsRepo;
  AddToCartUseCase(this.getProductDetailsRepo);

  Future<Either<RouteFailures, AddToCartModel>> call(String prodId) =>
      getProductDetailsRepo.addToCart(prodId);
}
