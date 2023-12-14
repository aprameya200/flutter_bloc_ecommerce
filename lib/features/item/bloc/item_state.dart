part of 'item_bloc.dart';

@immutable
abstract class ItemState {}

abstract class ItemActionsState extends ItemState {}

class ItemInitial extends ItemState {

}

class ItemLoadingState extends ItemState {}

class ItemLoadedSuccessState extends ItemState {
  final int quantity ;
  ItemLoadedSuccessState(this.quantity);
}

class ItemErrorState extends ItemState {}

class ItemAddQuantityActionState extends ItemActionsState {

  final int quantity ;
  ItemAddQuantityActionState(this.quantity);
}

class ItemSubtractQuantityActionState extends ItemActionsState {

  final int quantity ;
  ItemSubtractQuantityActionState(this.quantity);
}
