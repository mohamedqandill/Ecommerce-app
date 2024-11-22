import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/faliures/faliures.dart';


@injectable
class AddToWishlistUseCase{
  GetProductRepo getProductRepo;
  AddToWishlistUseCase(this.getProductRepo);

  Future<Either<RouteFailures, bool>> call(String prodId)=>getProductRepo.addToWishList(prodId);



}