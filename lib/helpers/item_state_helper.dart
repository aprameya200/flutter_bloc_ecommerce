import 'package:bloc_e_commerce/features/item/bloc/item_bloc.dart';

class ItemStateHelper{

  static bool isValidItemState(ItemState state) {
    return state is ItemAddQuantityActionState ||
        state is ItemLoadedSuccessState ||
        state is ItemSubtractQuantityActionState;
  }
}