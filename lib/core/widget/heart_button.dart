import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../features/product_details/presentation/bloc/product_details_bloc.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  ProductData? productModel;
  HeartButton({super.key, this.productModel, required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = IconsAssets.icHeart;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        toastification.show(
          context: context,
          backgroundColor:
              Colors.blueAccent, // optional if you use ToastificationWrapper
          title: const Text('Product has been added Successfully'),
          autoCloseDuration: const Duration(seconds: 3),
        );
        BlocProvider.of<ProductDetailsBloc>(context)
            .add(AddToWashEvent(widget.productModel?.id ?? ""));

        setState(() {
          isClicked = !isClicked;
          heartIcon =
              !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
          widget.onTap?.call();
        });
      },

      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              AssetImage(heartIcon),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
