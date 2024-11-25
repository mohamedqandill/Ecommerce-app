part of 'wash_list_bloc.dart';

@freezed
class WashListEvent with _$WashListEvent {
  const factory WashListEvent.started() = _Started;
  const factory WashListEvent.getWashList() = GetWashListEvent;
  const factory WashListEvent.addToCart(String id) = AddToCartsEvent;
}
