import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/CategoryModel.dart';
import '../../domain/use_case/get_category_use_Case.dart';


part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoryUseCase getCategoryUseCase;
  HomeBloc(this.getCategoryUseCase) : super(HomeInit()) {
    on<GetCategoryEvent>((event, emit) async{
      emit(
          state.copyWith(
              getCategoryState: RequestState.loading,

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
                getCategoryState: RequestState.success,
                categoryModel: r
            )
        );
      },);


    });
  }
}
