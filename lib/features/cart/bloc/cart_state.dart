part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartLoadedSuccessState extends CartState{
  final int cartQuantity;

  CartLoadedSuccessState(this.cartQuantity);
}

class CartAddQuanityActionState extends CartActionState{
  final int cartQuantity ;

  CartAddQuanityActionState(this.cartQuantity);
}

class CartSubtractQuanityActionState extends CartActionState{
  final int cartQuantity ;

  CartSubtractQuanityActionState(this.cartQuantity);
}
