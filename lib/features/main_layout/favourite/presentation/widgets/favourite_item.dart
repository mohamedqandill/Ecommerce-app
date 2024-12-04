import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WashListModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/bloc/wish_list_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../product_details/presentation/bloc/product_details_bloc.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({
    required this.washListData,
    super.key,
  });

  WashListData? washListData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetails,
        );
      },
      child: Container(
        height: AppSize.s135.h,
        padding: EdgeInsets.only(right: AppSize.s8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: ColorManager.primary.withOpacity(.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border:
                      Border.all(color: ColorManager.primary.withOpacity(.6))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: washListData?.imageCover ?? "",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.purbble,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: AppSize.s8.w),
                    child: FavouriteItemDetails(
                      washListData: washListData,
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      BlocProvider.of<WashListBloc>(context)
                          .add(DeleteWishListEvent(washListData?.id ?? ""));
                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          BlocProvider.of<WashListBloc>(context)
                              .add(GetWashListEvent());
                        },
                      );
                    },
                  child: Image.asset(
                    IconsAssets.icDelete,
                    color: ColorManager.textColor,
                    height: 22.h,
                  ),),
                SizedBox(height: AppSize.s14.h),
                AddToCartButton(
                  text: AppConstants.addToCart,
                  onPressed: () {
                    toastification.show(
                      context: context,
                      backgroundColor: Color(0xff8E6CEF),
                      // optional if you use ToastificationWrapper
                      title: const Text(
                        "Product Added Successfully To Your Cart",
                        style:  TextStyle(
                            color: Colors.white),
                      ),
                      autoCloseDuration:
                      const Duration(seconds: 3),
                    );
                    BlocProvider.of<WashListBloc>(context)
                        .add(AddToCartsEvent(washListData?.id ?? ""));
                  },
                  //TODO:add product to cart
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
