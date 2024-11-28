import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forget_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/new_password_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/reset_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/categories_screen.dart';
import 'package:ecommerce_app/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

import '../../features/cart/presentation/screens/cart_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) =>  CartScreen());
      case Routes.forgetRoute:
        return MaterialPageRoute(builder: (_) => ForgetScreen());
      case Routes.resetRoute:
        return MaterialPageRoute(builder: (_) => ResetScreen());
      case Routes.newRoute:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());
      case Routes.categoryRoute:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  ProductsScreen());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) =>  ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
