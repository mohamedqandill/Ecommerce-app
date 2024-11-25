import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/routes_manager/routes.dart';
import '../../../../di.dart';
import '../bloc/product_details_bloc.dart';

class ProductDetails extends StatelessWidget {
  ProductData? productModel;

  ProductDetails({ this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailsBloc>(),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Product Details',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 20.sp),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cartRoute);
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorManager.primary,
                    )),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ProductSlider(
                    items: (productModel?.images?.map((imageUrl) {
                      return ProductItem(productModel:productModel,imageUrl: imageUrl);
                    }).toList()) ?? [], initialIndex: 0,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ProductLabel(
                      productName: productModel?.title?.substring(0, 10) ?? "",
                      productPrice: productModel?.price?.toString()??""),
                  SizedBox(
                    height: 16.h,
                  ),
                  ProductRating(
                      productBuyers: productModel?.ratingsQuantity?.toString()??"",
                      productRating: productModel?.ratingsAverage?.toString()??""),
                  SizedBox(
                    height: 16.h,
                  ),
                  ProductDescription(
                      productDescription:
                      productModel?.description ?? ""),
                  ProductSize(
                    size: const [35, 38, 39, 40],
                    onSelected: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Color',
                      style: getMediumStyle(
                          color: ColorManager.appBarTitleColor)
                          .copyWith(fontSize: 18.sp)),
                  ProductColor(color: const [
                    Colors.red,
                    Colors.blueAccent,
                    Colors.green,
                    Colors.yellow,
                  ], onSelected: () {}),
                  SizedBox(
                    height: 48.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: getMediumStyle(
                                color: ColorManager.primary.withOpacity(.6))
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(productModel!.price.toString(),
                              style:
                              getMediumStyle(
                                  color: ColorManager.appBarTitleColor)
                                  .copyWith(fontSize: 18.sp))
                        ],
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          label: 'Add to cart',
                          onTap: () {
                            toastification.show(
                              context: context,
                              backgroundColor: Colors.white, // optional if you use ToastificationWrapper
                              title:  Text("${state.addToCartModel?.message}",style: TextStyle(color: Colors.lightBlueAccent),),
                              autoCloseDuration: const Duration(seconds: 3),
                            );
                            BlocProvider.of<ProductDetailsBloc>(context)
                                .add(AddToCartEvent(productModel?.id??""));

                          },
                          prefixIcon: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: ColorManager.white,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
