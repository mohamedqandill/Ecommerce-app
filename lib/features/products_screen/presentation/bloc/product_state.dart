part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial({
    @Default(RequestState.init)RequestState getProductState,
    String? errorMessage,
    ProductModel? productModel,
}) = _Initial;
}
