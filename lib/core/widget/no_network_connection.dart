import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoNetworkConnection extends StatelessWidget {
  const NoNetworkConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.purbble,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.circleExclamation,
                  size: 35.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "No Network Connection",
                  style:
                      getBoldStyle(color: Colors.black).copyWith(fontSize: 25.sp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
