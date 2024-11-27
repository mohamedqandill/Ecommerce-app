import 'dart:async';
import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/categories_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';

import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/assets_manager.dart';

import 'bloc/home_bloc.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
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
          //   if (state.getCategoryState == RequestState.loading) {
          //     showDialog(
          //         useSafeArea: true,
          //         context: context, builder: (context) {
          //       return const Center(child: CircularProgressIndicator(
          //         color: Colors.blue,
          //         backgroundColor: Colors.transparent,
          //       ));
          //     });
          //   }


          // Handle the error states - close dialog on error if it's opened
          if (state.getCategoryState == RequestState.error ) {

          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAdsWidget(
                  adsImages: adsImages,
                  currentIndex: _currentIndex,
                  timer: _timer,
                ),
                Column(
                  children: [
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return CategoriesScreen();
                          },));

                    }),
                    SizedBox(
                      height: 270.h,
                      child: Skeletonizer(
                        enabled: isEnabled?true:false,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {

                            return  CustomCategoryWidget(
                              categoryModel: state.categoryModel!.data![index],
                            );
                          },
                          itemCount: state.categoryModel?.data?.length??0,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomSectionBar(sectionNname: 'Brands', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  CustomBrandWidget(
                            brandsData: state.brandsModel?.data?[index],
                          );
                        },
                        itemCount: state.brandsModel?.data?.length??0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                    // CustomSectionBar(
                    //   sectionNname: 'Most Selling Products',
                    //   function: () {},
                    // ),
                    // SizedBox(
                    //   child: SizedBox(
                    //     height: 360.h,
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return const ProductCard(
                    //           title: "Nike Air Jordon",
                    //           description:
                    //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                    //           rating: 4.5,
                    //           price: 1100,
                    //           priceBeforeDiscound: 1500,
                    //           image: ImageAssets.categoryHomeImage,
                    //         );
                    //       },
                    //       itemCount: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 12.h),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
