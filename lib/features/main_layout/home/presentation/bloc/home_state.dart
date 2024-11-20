part of 'home_bloc.dart';

class HomeState {
  RequestState? getCategoryState;
  CategoryModel? categoryModel;
  String? errorMessage;
  HomeState({this.categoryModel, this.errorMessage, this.getCategoryState});

  HomeState copyWith(
      {RequestState? getCategoryState,
      CategoryModel? categoryModel,
      String? errorMessage}) {
    return HomeState(
        errorMessage: errorMessage ?? this.errorMessage,
        categoryModel: categoryModel ?? this.categoryModel,
        getCategoryState: getCategoryState ?? this.getCategoryState);
  }
}

class HomeInit extends HomeState{
  HomeInit():super(
    categoryModel: null,
    errorMessage: "",
    getCategoryState: RequestState.init

  );
}