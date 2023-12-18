import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {

    on<CartInitialEvent>(cartInitialEvent);
    on<CartAddItemQuantityButtonClickedEvent>(cartAddItemQuantityButtonClickedEvent);
    on<CartSubtractItemQuantityButtonClickedEvent>(cartSubtractItemQuantityButtonClickedEvent);
    on<CartDeleteItemFromCartEvent>(cartDeleteItemFromCartEvent);
  }

  FutureOr<void> cartDeleteItemFromCartEvent(CartDeleteItemFromCartEvent event, Emitter<CartState> emit){

    CartItems.instance.cartItems.remove(event.key);
    CartItems.instance.getTotalPriceOfCart();

    emit(CartLoadedSuccessState(0));
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit){

    emit(CartLoadedSuccessState(0));
  }

  FutureOr<void> cartAddItemQuantityButtonClickedEvent(
      CartAddItemQuantityButtonClickedEvent event, Emitter<CartState> emit) {

    ++CartItems.instance.cartItems[event.key];
    CartItems.instance.getTotalPriceOfCart();

    emit(CartLoadedSuccessState(0));

    emit(CartLoadedSuccessState((state as CartLoadedSuccessState).cartQuantity + 1));
  }

  FutureOr<void> cartSubtractItemQuantityButtonClickedEvent(
      CartSubtractItemQuantityButtonClickedEvent event, Emitter<CartState> emit) {

    CartItems.instance.cartItems[event.key]! > 1 ? --CartItems.instance.cartItems[event.key]: CartItems.instance.cartItems[event.key];
    CartItems.instance.getTotalPriceOfCart();


    emit(CartLoadedSuccessState(0));
  }
}
