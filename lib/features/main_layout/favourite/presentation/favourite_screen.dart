import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/bloc/wash_list_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/enums.dart';
import '../../../../di.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<WashListBloc>()
        ..add( GetWashListEvent()),
      child: BlocConsumer<WashListBloc, WashListState>(
        listener: (context, state) {
          if(state.getWashListState==RequestState.loading){
            showDialog
              (
              context: context, builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Center(
                  child: CircularProgressIndicator(color: Colors.blue,),
                ),
              );
            },);
          }
          if(state.getWashListState==RequestState.success){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
              child: ListView.builder(
                itemCount: state.washListModel?.data?.length??0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child:
                    FavoriteItem(
                        washListData: state.washListModel?.data?[index],
                        product: AppConstants.favoriteProducts[index]),
                  );
                },
              ));
        },
      ),
    );
  }
}
