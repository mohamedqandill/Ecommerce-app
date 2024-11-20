
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/core/resources/observer.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   await CacheHelper.init();
 Future<String?> token= CacheHelper.getData<String>("token");
 print(token.toString());
  runApp( MainApp(
    isLogged: token == null?false:true,
  ));

}

class MainApp extends StatelessWidget {
  bool isLogged;
   MainApp({required this.isLogged,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute:!isLogged? Routes.signInRoute:Routes.mainRoute,
      ),
    );
  }
}
