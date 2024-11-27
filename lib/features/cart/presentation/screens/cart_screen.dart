import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(GetCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.getCartState == RequestState.success) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                isEnabled = false;
                setState(() {});
              },
            );
          }
          // if(state.getCartState==RequestState.loading){
          //   showDialog(context: context, builder: (context) {
          //     return const  Center(child: CircularProgressIndicator(
          //       color: Colors.blue,
          //       backgroundColor: Colors.transparent,
          //
          //     ),);
          //   },);
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style:
                    getMediumStyle(fontSize: 20, color: ColorManager.textColor),
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
            body: state.getCartModel?.numOfCartItems == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/check-out 1.png"),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Text(
                          "Your Cart is Empty",
                          style: getBoldStyle(color: ColorManager.black)
                              .copyWith(fontSize: FontSize.s24.sp),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff8E6CEF),
                                fixedSize: Size(210.w, 60.h)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.categoryRoute);
                            },
                            child: Text(
                              "Explore Categories",
                              style: getBoldStyle(color: Colors.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<CartBloc>(context).add(DeleteCartEvent());
                            Future.delayed(Duration(seconds: 1),() {
                              BlocProvider.of<CartBloc>(context).add(GetCartEvent());
                            },);
                          },
                          child: Text(
                            "Clear All",
                            style: getBoldStyle(
                                color: Colors.black)
                                .copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: FontSize.s18),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Expanded(
                          // the list of cart items ===============
                          child: Skeletonizer(
                            enabled: isEnabled ? true : false,
                            child: ListView.separated(
                              itemBuilder: (context, index) => CartItemWidget(
                                colorName: "",
                                imagePath: state
                                        .getCartModel
                                        ?.data
                                        ?.products?[index]
                                        .product
                                        ?.imageCover ??
                                    "",
                                title: state.getCartModel?.data
                                        ?.products?[index].product?.title ??
                                    "",
                                price: state.getCartModel?.data
                                        ?.products?[index].price ??
                                    0,
                                quantity: state.getCartModel?.data
                                        ?.products?[index].count ??
                                    0,
                                onDeleteTap: () {},
                                onDecrementTap: (value) {},
                                onIncrementTap: (value) {},
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.s12.h),
                              itemCount:
                                  state.getCartModel?.data?.products?.length ??
                                      0,
                            ),
                          ),
                        ),
                        // the total price and checkout button========
                        TotalPriceAndCheckoutBotton(
                          totalPrice:
                              state.getCartModel?.data?.totalCartPrice ?? 0,
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
