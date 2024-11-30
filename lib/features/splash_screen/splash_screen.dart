import 'package:flutter/material.dart';

import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4,),() {
      Navigator.pushNamed(context, Routes.signInRoute);
    },);
    return Container(
      width: double.infinity,
      color: Color(0xff8E6CEF),
      child: Center(
        child: Image.asset("assets/images/Rectangle 13.png"),
      ),
    );
  }
}
