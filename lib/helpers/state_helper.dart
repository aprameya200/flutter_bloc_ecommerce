import 'package:bloc_e_commerce/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_e_commerce/features/item/bloc/item_bloc.dart';

class ItemStateHelper {
  static bool isValidItemState(ItemState state) {
    return state is ItemAddQuantityActionState ||
        state is ItemLoadedSuccessState ||
        state is ItemSubtractQuantityActionState;
  }
}

class CartStateHelper {
  static bool isValidCartState(CartState state) {
    return state is CartAddQuanityActionState ||
        state is CartLoadedSuccessState ||
        state is CartSubtractQuanityActionState;
  }
}
