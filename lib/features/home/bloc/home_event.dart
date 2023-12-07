part of 'home_bloc.dart';

//create classes for all the possible event that can be dont from this home page

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductAddToWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductAddToCartClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
