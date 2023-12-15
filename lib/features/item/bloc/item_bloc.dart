import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_e_commerce/data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../../models/product_model.dart';
import '../../../data/item_quantity.dart';


part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<ItemInitialEvent>(itemInitialEvent);
    on<ItemAddQuantityButtonClickedEvent>(itemAddQuantityButtonClickedEvent);
    on<ItemSubtractQuantityButtonClickedEvent>(itemSubtractQuantityButtonClickedEvent);
    on<ItemAddToCartButtonClickedEvent>(itemAddToCartButtonClickedEvent);
  }

  FutureOr<void> itemInitialEvent(
      ItemInitialEvent event, Emitter<ItemState> emit) {

    emit(ItemLoadedSuccessState(1));
  }

  FutureOr<void> itemAddQuantityButtonClickedEvent(
      ItemAddQuantityButtonClickedEvent event, Emitter<ItemState> emit) {

    int sum = (state as ItemLoadedSuccessState).quantity + 1;

    emit(ItemLoadedSuccessState(sum));
  }

  FutureOr<void> itemSubtractQuantityButtonClickedEvent(
      ItemSubtractQuantityButtonClickedEvent event, Emitter<ItemState> emit) {

    int diff = (state as ItemLoadedSuccessState).quantity - 1;

    emit(ItemLoadedSuccessState(diff));
  }

  FutureOr<void> itemAddToCartButtonClickedEvent(
      ItemAddToCartButtonClickedEvent event, Emitter<ItemState> emit) {

    int qty = (state as ItemLoadedSuccessState).quantity;

    CartItems.instance.cartItems.addAll({event.product: qty});

    emit(ItemLoadedSuccessState(qty));
  }
}
