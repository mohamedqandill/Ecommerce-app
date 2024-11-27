import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/category_box.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/enums.dart';
import '../../../../core/widget/home_screen_app_bar.dart';
import '../../../../di.dart';
import 'bloc/home_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isEnabled=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<HomeBloc>()
        ..add(GetCategoryEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.getCategoryState == RequestState.success ) {
            Future.delayed(const Duration(seconds: 2),() {
              isEnabled=false;
              setState(() {

              });
            },); // Close the loading dialog only when both are successful
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const HomeScreenAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);

                          },
                          child: const Icon(Icons.arrow_back,size: 25,color: Colors.black,)),
                      SizedBox(width: 20.sp,),
                      Text(
                        "Shop by Categories",
                        style: getBoldStyle(color: Colors.black).copyWith(
                          fontSize: FontSize.s24.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.sp,),
                  Expanded(
                    child: Skeletonizer(
                      enabled: isEnabled?true:false,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15.sp,
                          );
                        },
                        itemCount: state.categoryModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) {
                                return ProductsScreen(
                                  id: state.categoryModel?.data?[index].id ?? "",);
                              },));
                            },
                            child: CategoryBox(
                              title: state.categoryModel?.data?[index].name ?? "",
                              image: state.categoryModel?.data?[index].image ??
                                  "assets/images/parcel 1.png",
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


