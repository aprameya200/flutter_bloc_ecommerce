import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_e_commerce/helpers/helper.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../../services/product_service.dart';
import '../../item/ui/item.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent); //initil event

    on<HomeWishlistButtonNavigateEvent>(
        homeWishlistButtonNavigateEvent); //for x event pass y state
    on<HomeCartButtonNavigateEvent>(
        homeCartButtonNavigateEvent); //for x event pass y state
    on<HomeProductAddToWishlistButtonClickedEvent>(
        homeProductAddToWishlistButtonClickedEvent); //for x event pass y state
    on<HomeProductAddToCartClickedEvent>(
        homeProductAddToCartClickedEvent); //for x event pass y state
    on<HomePressFilterButtonEvent>(
        homePressFilterButtonEvent); //for x event pass y state

    on<HomeProductNavigateEvent>(homeProductClickedEvent);
  }




  FutureOr<void> homeProductClickedEvent(
      HomeProductNavigateEvent event, Emitter<HomeState> emit) {
    print("Press Wishlist");

    ItemPage page = event.itemPage;

    emit(HomeNavigateToProductPageActionState(page));
  }

  FutureOr<void> homePressFilterButtonEvent(
      HomePressFilterButtonEvent event, Emitter<HomeState> emit) {

    List<ProductModel> allProducts = (state as HomeLoadedSuccessState).products;
    List<ProductModel> originalProductList =
        (state as HomeLoadedSuccessState).originalProductList;

    // Perform filtering based on the button press event
    List<ProductModel> filteredProducts =
        Helper.filterProducts(event.filterTerm, originalProductList);
    print(event.filterTerm + " length is " + allProducts.length.toString());

    // Emit the filtered products
    emit(HomeLoadedSuccessState(filteredProducts, originalProductList));
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    //getting data from API
    final dataService = ProductService();
    List<ProductModel> products = await dataService.getDataFromService();
    List<ProductModel> originalProductList = products;

    List<ProductModel> filteredProducts =
        Helper.filterProducts("All", products);

    //emmiting the retrieved data
    emit(HomeLoadedSuccessState(filteredProducts, originalProductList));
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Press Wishlist");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    // print("Press Cart");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductAddToWishlistButtonClickedEvent(
      HomeProductAddToWishlistButtonClickedEvent event,
      Emitter<HomeState> emit) {

    WishlistItems.instance.wishlistItems.add(event.clickedProduct);
    print("added to wishlist");
    print(event.clickedProduct.name.toString() + " added to wishlist");
  }

  FutureOr<void> homeProductAddToCartClickedEvent(
      HomeProductAddToCartClickedEvent event, Emitter<HomeState> emit) {
    print("Press add to cart");
  }
}
