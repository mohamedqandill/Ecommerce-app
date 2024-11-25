part of 'wash_list_bloc.dart';

@freezed
class WashListState with _$WashListState {
  const factory WashListState.initial({
   @Default(RequestState.init)
   RequestState? getWashListState,
   RequestState? addToCartState,
    WashListModel? washListModel,
    String? errorMessage,
}) = _Initial;
}
