import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/core/network_connection/network_connection_checker.dart';
import 'package:ecommerce_app/core/resources/observer.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';
import 'core/widget/no_network_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await CacheHelper.init();
  String? token = CacheHelper.getData<String>("token");
  print(token);

  runApp(MainApp(
    isLogged: token == null ? false : true,
  ));
}

class MainApp extends StatelessWidget {
  bool isLogged;

  MainApp({required this.isLogged, super.key});

  @override
  Widget build(BuildContext context) {
    NetworkConnectionChecker.instance.init();
    return ValueListenableBuilder(
      valueListenable: NetworkConnectionChecker.instance.isConnected,
      builder: (context, isConnected, child) {
        return isConnected
            ? ScreenUtilInit(
                designSize: const Size(430, 932),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: child,
                  onGenerateRoute: RouteGenerator.getRoute,
                  initialRoute: isLogged ? Routes.mainRoute : Routes.splash,
                ),
              )
            : const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "No Network Connection",
          home: NoNetworkConnection(),
        );
      },
    );
  }
}
