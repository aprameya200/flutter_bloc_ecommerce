part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartAddItemQuantityButtonClickedEvent extends CartEvent{

  final ProductModel key;

  CartAddItemQuantityButtonClickedEvent(this.key);
}

class CartSubtractItemQuantityButtonClickedEvent extends CartEvent{

  final ProductModel key;

  CartSubtractItemQuantityButtonClickedEvent(this.key);
}

class CartCheckoutButtonClickedEvent extends CartEvent{}

class CartDeleteItemFromCartEvent extends CartEvent{
  final ProductModel key;

  CartDeleteItemFromCartEvent(this.key);
}
