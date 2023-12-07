part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionsState extends HomeState{

}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistActionState extends HomeActionsState{}

class HomeNavigateToCartPAgeActionState extends HomeActionsState{}
