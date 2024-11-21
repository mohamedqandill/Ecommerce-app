import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<CartBloc>()
        ..add( GetCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if(state.getCartState==RequestState.success){
            Navigator.pop(context);
          }
          if(state.getCartState==RequestState.loading){
            showDialog(context: context, builder: (context) {
              return Center(child: CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.transparent,

              ),);
            },);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: getMediumStyle(
                    fontSize: 20, color: ColorManager.textColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(
                      IconsAssets.icSearch,
                    ),
                    color: ColorManager.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(IconsAssets.icCart),
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                children: [
                  Expanded(
                    // the list of cart items ===============
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          CartItemWidget(
                            imagePath: state.getCartModel?.data?.products?[index].product?.imageCover??"",
                            title: state.getCartModel?.data?.products?[index].product?.title??"",
                            price:  state.getCartModel?.data?.products?[index].price??0,
                            quantity:  state.getCartModel?.data?.products?[index].count??0,
                            onDeleteTap: () {},
                            onDecrementTap: (value) {},
                            onIncrementTap: (value) {},
                            size: 40,
                            color: Colors.black,
                            colorName: 'Black',
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSize.s12.h),
                      itemCount: state.getCartModel?.data?.products?.length??0,
                    ),
                  ),
                  // the total price and checkout button========
                  TotalPriceAndCheckoutBotton(
                    totalPrice:  state.getCartModel?.data?.totalCartPrice??0,
                    checkoutButtonOnTap: () {},
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
