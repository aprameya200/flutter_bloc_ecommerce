part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class ItemInitialEvent extends ItemEvent{}

class ItemProductAddToWishlistButtonClickedEvent extends ItemEvent{}

class ItemAddQuantityButtonClickedEvent extends ItemEvent{

}

class ItemSubtractQuantityButtonClickedEvent extends ItemEvent{

}

class ItemAddToCartButtonClickedEvent extends ItemEvent{

  final ProductModel product;

  ItemAddToCartButtonClickedEvent(this.product);
}





