part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class ItemInitialEvent extends ItemEvent{}

class ItemProductAddToWishlistButtonClickedEvent extends ItemEvent{}

class ItemAddQuantityButtonClickedEvent extends ItemEvent{
  int quantity = 1;


}

class ItemSubtractQuantityButtonClickedEvent extends ItemEvent{

  int quantity = -1;

}

class ItemAddToCartButtonClickedEvent extends ItemEvent{}





