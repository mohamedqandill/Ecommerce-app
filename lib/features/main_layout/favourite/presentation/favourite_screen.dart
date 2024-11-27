import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/bloc/wish_list_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/enums.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../di.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WashListBloc>()..add(const GetWashListEvent()),
      child: BlocConsumer<WashListBloc, WashListState>(
        listener: (context, state) {
          // if (state.getWashListState == RequestState.loading ||
          //     state.addToCartState == RequestState.loading) {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const AlertDialog(
          //         backgroundColor: Colors.transparent,
          //         content: Center(
          //           child: CircularProgressIndicator(
          //             color: Colors.blue,
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // }
          if (state.getWashListState == RequestState.success) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                isEnabled = false;
                setState(() {});
              },
            );
          }
        },
        builder: (context, state) {
          return state.washListModel?.count == 0
              ? Center(
                child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/parcel 1.png"),
                    SizedBox(height: 10.sp,),
                    Text("No Favourite Item",style: getBoldStyle(color: ColorManager.black).copyWith(fontSize: FontSize.s24.sp),)
                  ],
                ),
              )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                  child: Skeletonizer(
                    enabled: isEnabled ? true : false,
                    child: ListView.builder(
                      itemCount: state.washListModel?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: AppSize.s12.h),
                          child: FavoriteItem(
                            washListData: state.washListModel?.data?[index],
                          ),
                        );
                      },
                    ),
                  ));
        },
      ),
    );
  }
}
