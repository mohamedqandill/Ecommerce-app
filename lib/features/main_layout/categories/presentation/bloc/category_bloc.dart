import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/use_cases/sub_category_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoryModel.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_category_use_Case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/bloc/home_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoryUseCase getCategoryUseCase;
  GetSubCategoryUseCase getSubCategoryUseCase;
  CategoryBloc(this.getCategoryUseCase,this.getSubCategoryUseCase) : super(const CategoryState.initial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(
          categoryModel: null,
          errorMessage: "",
          getCategoriesState: RequestState.loading));
      var result = await getCategoryUseCase.call();
      result.fold(
        (l) {
          emit(state.copyWith(
              categoryModel: null,
              errorMessage: l.toString(),
              getCategoriesState: RequestState.error));

        },
        (r) {
          emit(state.copyWith(
              categoryModel: r,
              errorMessage: "",
              getCategoriesState: RequestState.success));
          add(GetSubCategoriesEvent(r.data?.first.id??""));
        },
      );
    });

    on<GetSubCategoriesEvent>((event, emit) async {
      emit(state.copyWith(
          subCategoryModel: null,
          errorMessage: "",
          getSubCategoriesState: RequestState.loading));
      var result = await getSubCategoryUseCase.call(event.catId);
      result.fold(
            (l) {
          emit(state.copyWith(
              subCategoryModel: null,
              errorMessage: l.toString(),
              getSubCategoriesState: RequestState.error));


        },
            (r) {
          emit(state.copyWith(
              subCategoryModel: r,
              errorMessage: "",
              getSubCategoriesState: RequestState.success));
        },
      );
    });
  }
}
