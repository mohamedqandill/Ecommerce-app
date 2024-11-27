import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({required this.image, required this.title, super.key});

  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4), borderRadius: BorderRadius.circular(10)),
      width: 300.w,
      height: 75.h,
      child: Row(
        children: [
          CachedNetworkImage(

            width: 80.sp,
            height: 70.sp,

            imageUrl: image??"",

            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),

          ),
          SizedBox(
            width: 20.sp,
          ),
          Text(
            title ?? "",
            style: getSemiBoldStyle(color: Colors.black)
                .copyWith(fontSize: FontSize.s18.sp),
          )
        ],
      ),
    );
  }
}