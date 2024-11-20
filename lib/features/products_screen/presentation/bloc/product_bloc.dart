import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/product_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductUseCase getProductUseCase;
  ProductBloc(this.getProductUseCase) : super(const ProductState.initial()) {
    on<GetProductsEvent>((event, emit)async {
      emit(state.copyWith(
          productModel: null,
          errorMessage: "",
          getProductState: RequestState.loading));
      var result = await getProductUseCase.call(event.id);
      result.fold(
            (l) {
          emit(state.copyWith(
              productModel: null,
              errorMessage: l.toString(),
              getProductState: RequestState.error));

        },
            (r) {
          emit(state.copyWith(
              productModel: r,
              errorMessage: "",
              getProductState: RequestState.success));

        },
      );
    });
  }
}
