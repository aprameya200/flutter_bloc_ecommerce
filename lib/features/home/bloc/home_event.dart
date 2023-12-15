part of 'home_bloc.dart';

//create classes for all the possible event that can be dont from this home page

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductAddToWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductAddToWishlistButtonClickedEvent(this.clickedProduct);
}

class HomeProductAddToCartClickedEvent extends HomeEvent {}

class HomePressFilterButtonEvent extends HomeEvent {
  final String filterTerm;

  HomePressFilterButtonEvent( {required this.filterTerm});
  // @override
  // List<Object> get props => [filterTerm];
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}


class HomeProductNavigateEvent extends HomeEvent{

  final ItemPage itemPage;

  HomeProductNavigateEvent(this.itemPage);
}

class HomeNavigateBackEvent extends HomeEvent{}

class HomeAlreadyLoadedEvent extends HomeEvent{}
