part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial({
   @Default(RequestState.init) RequestState? addToCartState,
   @Default(RequestState.init) RequestState? addToWashState,
    AddToCartModel? addToCartModel
}) = _Initial;
}
