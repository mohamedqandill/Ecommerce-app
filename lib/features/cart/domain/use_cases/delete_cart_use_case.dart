import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:ecommerce_app/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/faliures/faliures.dart';

@injectable
class DeleteCartUseCase {
  GetCartRepo getCartRepo;
  DeleteCartUseCase(this.getCartRepo);

  Future<Either<RouteFailures, bool>> call() =>
      getCartRepo.deleteCart();
}
