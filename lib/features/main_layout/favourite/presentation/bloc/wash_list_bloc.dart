import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'wash_list_event.dart';
part 'wash_list_state.dart';
part 'wash_list_bloc.freezed.dart';

@injectable
class WashListBloc extends Bloc<WashListEvent, WashListState> {
  GetWashListUseCase getWashListUseCase;
  WashListBloc(this.getWashListUseCase) : super(const WashListState.initial()) {
    on<GetWashListEvent>((event, emit)async {
      emit(state.copyWith(

          getWashListState: RequestState.loading
      ));

      var result=await getWashListUseCase.call();
      result.fold((l) {
        emit(state.copyWith(
          errorMessage: l.toString(),
          getWashListState: RequestState.error
        ));

      }, (r) {
        emit(state.copyWith(
          washListModel: r,
            getWashListState: RequestState.success
        ));

      },);
    });
  }
}
