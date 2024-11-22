import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/product_details/data/models/AddToCartModel.dart';
import 'package:ecommerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:flutter/gestures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

@injectable
class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  AddToCartUseCase addToCartUseCase;
  AddToWishlistUseCase addToWishlistUseCase;
  ProductDetailsBloc(this.addToCartUseCase,this.addToWishlistUseCase) : super(const ProductDetailsState.initial()) {
    on<AddToCartEvent>((event, emit)async {
      emit(state.copyWith(
        addToCartState: RequestState.loading
      ));

      var result=await addToCartUseCase.call(event.prodId);

      result.fold((l) {
        emit(state.copyWith(
            addToCartState: RequestState.error
        ));
      },
           (r) {
             emit(state.copyWith(
               addToCartModel: r,
                 addToCartState: RequestState.success
             ));
           },);
    });
    on<AddToWashEvent>((event, emit)async {
      emit(state.copyWith(
       addToWashState : RequestState.loading
      ));

      var result=await addToWishlistUseCase.call(event.prodId);

      result.fold((l) {
        emit(state.copyWith(
            addToWashState: RequestState.error
        ));
      },
           (r) {
             emit(state.copyWith(
                 addToWashState: RequestState.success
             ));
           },);
    });
  }
}
