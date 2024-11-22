part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.getProductEvent(String id) = GetProductsEvent;
  const factory ProductEvent.addToWishListEvent(String id) = AddToWishListEvent;
}
