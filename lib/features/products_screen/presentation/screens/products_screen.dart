import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/products_screen/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  String? id;
   ProductsScreen({ this.id,super.key});

  @override
  Widget build(BuildContext context) {
    // String id=ModalRoute.of(context)!.settings.arguments as String;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
  create: (context) => getIt<ProductBloc>()..add(GetProductsEvent(id!)),
  child: BlocConsumer<ProductBloc, ProductState>(
  listener: (context, state) {
    if(state.getProductState==RequestState.loading){
      showDialog
          (
          context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircularProgressIndicator(color: Colors.blue,),
            ),
          );
        },);
    }
    if(state.getProductState==RequestState.success){
      Navigator.pop(context);
    }
  },
  builder: (context, state) {

    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: state.productModel?.data?.length??0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 12,
                ),
                itemBuilder: (context, index) {
                  return CustomProductWidget(
                    productModel:state.productModel?.data?[index],
                    image: state.productModel?.data?[index].imageCover??"",
                    title: state.productModel?.data?[index].title??"",
                    price: state.productModel?.data?[index].price?.toDouble()??0.0,
                    rating: state.productModel?.data?[index].ratingsAverage?.toDouble()??0.0,
                    discountPercentage:state.productModel?.data?[index].sold?.toDouble()??0.0,
                    height: height,
                    width: width,
                    description:
                    state.productModel?.data?[index].description??"",
                  );
                },
                scrollDirection: Axis.vertical,
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
