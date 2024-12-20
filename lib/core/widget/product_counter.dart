import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
   int productCounter;
  final void Function(int) add;
  final void Function(int) remove;
  int? price;
   ProductCounter(
      {super.key,
        required this.price,
      required this.add,
      required this.remove,
      required this.productCounter});

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.purbble,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                widget.remove.call(widget.productCounter);
               widget. productCounter--;
               setState(() {

               });

              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 20.w,
                color: ColorManager.white,
              )),
          SizedBox(
            width: 18.w,
          ),
          Text(
            '${widget.productCounter}',
            style: getMediumStyle(color: ColorManager.white)
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(
            width: 18.w,
          ),
          InkWell(
              onTap: () {
                widget.productCounter++;


                setState(() {

                  widget.price!*widget.productCounter;
                  print(widget.price);
                  print(widget.price);
                });
                widget.add.call(widget.productCounter);
              },
              child: Icon(
                Icons.add_circle_outline,
                color: ColorManager.white,
                size: 20.w,
              )),
        ],
      ),
    );
  }
}
