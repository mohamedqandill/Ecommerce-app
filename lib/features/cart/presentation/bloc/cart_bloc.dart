import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartUseCase getCartUseCase;
  CartBloc(this.getCartUseCase) : super(const CartState.initial()) {
    on<GetCartEvent>((event, emit)async {
      emit(state.copyWith(


          getCartState: RequestState.loading));

      var result = await getCartUseCase.call();
      result.fold(
            (l) {
          emit(state.copyWith(


              getCartState: RequestState.error));

        },
            (r) {
          emit(state.copyWith(
              getCartModel: r,
              getCartState: RequestState.success));

        },
      );
    });
  }
}
