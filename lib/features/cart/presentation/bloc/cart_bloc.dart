import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartModel.dart';
import 'package:ecommerce_app/features/cart/data/models/item_model.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/keys/keys.dart';
import '../../data/models/amount_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartUseCase getCartUseCase;
  DeleteCartUseCase deleteCartUseCase;
  CartBloc(this.getCartUseCase,this.deleteCartUseCase) : super(const CartState.initial()) {
    on<GetCartEvent>((event, emit)async {
      emit(state.copyWith(
        getCartModel: null,


          getCartState: RequestState.loading));

      var result = await getCartUseCase.call();


      result.fold(
            (l) {
          emit(state.copyWith(


              getCartState: RequestState.error));

        },
            (r) {
          emit(state.copyWith(
              getCartModel: r,
              getCartState: RequestState.success));



    });
    on<DeleteCartEvent>((event, emit)async {
      emit(state.copyWith(
        getCartModel: null,


          deleteCartState: RequestState.loading));

      var result = await deleteCartUseCase.call();
      result.fold(
            (l) {
          emit(state.copyWith(


              deleteCartState: RequestState.error));

        },
            (r) {
          emit(state.copyWith(

              deleteCartState: RequestState.success));

        },
      );
    });}
    );}}
