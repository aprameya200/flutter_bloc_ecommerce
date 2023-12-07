import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent); //for x event pass y state
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent); //for x event pass y state
    on<HomeProductAddToWishlistButtonClickedEvent>(homeProductAddToWishlistButtonClickedEvent); //for x event pass y state
    on<HomeProductAddToCartClickedEvent>(homeProductAddToCartClickedEvent); //for x event pass y state
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event,Emitter<HomeState> emit){
      print("Press Wishlist");
      emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event,Emitter<HomeState> emit){
    print("Press Cart");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductAddToWishlistButtonClickedEvent(HomeProductAddToWishlistButtonClickedEvent event,Emitter<HomeState> emit){
      print("Press add to wishlist");
  }

  FutureOr<void> homeProductAddToCartClickedEvent(HomeProductAddToCartClickedEvent event,Emitter<HomeState> emit){
    print("Press add to cart");
  }
}
