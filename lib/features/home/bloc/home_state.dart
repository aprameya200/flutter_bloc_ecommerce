part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionsState extends HomeState{

}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{ //when home is loaded, then i need to see a list of products

  final  List<ProductModel> products;
  final  List<ProductModel> originalProductList;

  HomeLoadedSuccessState(this.products, this.originalProductList);
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionsState{}

class HomeNavigateToCartPageActionState extends HomeActionsState{}

class HomeFilterProductActionState extends HomeActionsState{
}

class HomeNavigateToProductPageActionState extends HomeActionsState{

  ItemPage item;

  HomeNavigateToProductPageActionState(this.item);
}

class HomeNavigateBackActionState extends HomeActionsState{}