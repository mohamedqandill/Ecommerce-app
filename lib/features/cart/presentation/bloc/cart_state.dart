part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial({
   @Default(RequestState.init) RequestState? getCartState,
    GetCartModel? getCartModel,
}) = _Initial;
}
