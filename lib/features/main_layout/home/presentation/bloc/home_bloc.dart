import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/BrandsModel.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_brands_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/CategoryModel.dart';
import '../../domain/use_case/get_category_use_Case.dart';


part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoryUseCase getCategoryUseCase;
  GetBrandsUSeCase getBrandsUSeCase;
  HomeBloc(this.getCategoryUseCase,this.getBrandsUSeCase) : super(HomeInit()) {
    on<GetCategoryEvent>((event, emit) async{
      emit(
          state.copyWith(

              getCategoryState: RequestState.loading,
            errorMessage: ""

          )
      );
      var result=await getCategoryUseCase.call();
      result.fold((l) {
        emit(
            state.copyWith(
                getCategoryState: RequestState.error,
                errorMessage: "Error"
            )
        );
      }, (r) {
        emit(
            state.copyWith(
               errorMessage: "",
                getCategoryState: RequestState.success,
                categoryModel: r
            )
        );
      },);


    });
    on<GetBrandsEvent>((event, emit) async{
      emit(
          state.copyWith(

              getBrandsState: RequestState.loading,
              errorMessage: ""

          )
      );
      var result=await getBrandsUSeCase.call();
      result.fold((l) {
        emit(
            state.copyWith(
                getBrandsState: RequestState.error,
                errorMessage: "Error"
            )
        );
      }, (r) {
        emit(
            state.copyWith(
                errorMessage: "",
                getBrandsState: RequestState.success,
                brandsModel: r
            )
        );
      },);


    });
  }
}
