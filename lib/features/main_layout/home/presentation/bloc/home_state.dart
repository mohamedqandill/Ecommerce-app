part of 'home_bloc.dart';

class HomeState {
  RequestState? getCategoryState;
  RequestState? getBrandsState;
  CategoryModel? categoryModel;
  BrandsModel? brandsModel;
  String? errorMessage;
  HomeState({this.categoryModel, this.errorMessage, this.getCategoryState,this.brandsModel,this.getBrandsState});

  HomeState copyWith(
      {
        RequestState? getCategoryState,
        RequestState? getBrandsState,
      CategoryModel? categoryModel,
        BrandsModel? brandsModel,
      String? errorMessage}) {
    return HomeState(
      getBrandsState: getBrandsState?? this.getBrandsState,
      brandsModel: brandsModel ?? this.brandsModel,
        errorMessage: errorMessage ?? this.errorMessage,
        categoryModel: categoryModel ?? this.categoryModel,
        getCategoryState: getCategoryState ?? this.getCategoryState);
  }
}

class HomeInit extends HomeState{
  HomeInit():super(
    categoryModel: null,
    brandsModel: null,
    errorMessage: "",
    getBrandsState: RequestState.init,
    getCategoryState: RequestState.init

  );
}