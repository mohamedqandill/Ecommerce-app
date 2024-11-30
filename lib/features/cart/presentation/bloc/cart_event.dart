part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;

  const factory CartEvent.getCart() = GetCartEvent;

  const factory CartEvent.deleteCart() = DeleteCartEvent;

  const factory CartEvent.checkOut(
          BuildContext context, List<OrderItemModel> orders, String amount) =
      CheckOutEvent;
}
