part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial({
    @Default(RequestState.init)
    RequestState? getCategoriesState,
    RequestState? getSubCategoriesState,
    String? errorMessage,
    CategoryModel? categoryModel,
    CategoryModel? subCategoryModel,
  }
      ) = _Initial;
}
