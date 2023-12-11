import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/features/home/bloc/home_bloc.dart';
import 'package:bloc_e_commerce/features/home/ui/banner_widget.dart';
import 'package:bloc_e_commerce/features/home/ui/popular_foods_widget.dart';
import 'package:bloc_e_commerce/features/home/ui/search_bar_widget.dart';
import 'package:bloc_e_commerce/features/home/ui/tile_menu_widget.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/wishlist.dart';
import 'package:bloc_e_commerce/models/category_model.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:bloc_e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../cart/ui/cart.dart';
import 'bar_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home UI
/**
 * Should listen to the states emitted by bloc and also accept events done/passed by the user
 *
 * So must me wrapped by bloc consumer
 */

class _HomePageState extends State<HomePage> {
  final HomeBloc homebloc = HomeBloc();
  late int seclectionColor = 0;

  @override
  void initState() {
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<CategoryModel> cat = [
      CategoryModel("All", "assets/all.png"),
      CategoryModel("Sushi", "assets/sushi.png"),
      CategoryModel("Ramen", "assets/ramen.png"),
      CategoryModel("Chicken", "assets/chicken-leg.png"),
    ];

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionsState,
      //listen when action
      //listen to click events
      buildWhen: (previous, current) => current is! HomeActionsState,
      //build when no action
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          //checks the data type of the obj
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          //checks the data type of the obj
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const WishlistPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState :
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFF1EBEB),
              appBar: AppBar(
                backgroundColor: const Color(0xFFF1EBEB),
                title: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.add_shopping_cart,
                              size: 25,
                            ),
                            onPressed: () {
                              homebloc.add(HomeCartButtonNavigateEvent());
                            },
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_location_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Tokyo",
                                style: TextStyle(
                                    fontSize: 24, fontFamily: "LibreFranklin"),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              size: 25,
                            ),
                            onPressed: () {
                              homebloc.add(HomeWishlistButtonNavigateEvent());
                            },
                          )
                        ]),
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BannerWidget(screenHeight: screenHeight),
                  const SearchBarWidget(),
                  /**
                   * Small menu
                   */
                  Container(
                    padding: const EdgeInsets.only(left: 26.0),
                    height: screenHeight * 0.056,
                    child: ListView.builder(
                        itemCount: cat.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homebloc.add(HomePressFilterButtonEvent(filterTerm: cat[index].catagoryName));
                              setState(() { //simply done using state
                                seclectionColor = index;
                              });
                            },
                            child: BarMenu(
                              categoryModel: cat[index], backgroundColor: seclectionColor == index ? Colors.red : Colors.black
                            ),
                          );
                        }),
                  ),
                  //Menu items
                  /**
                   * Menu big
                   */
                  SizedBox(
                    height: screenHeight * 0.27,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return TileMenu(
                          productModel: successState.products[index],
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        );
                      },
                    ),
                  ),
                  /**
                   * Popular Foods
                   */
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Popular Food",
                          style: TextStyle(
                              fontSize: 18, fontFamily: "LibreFranklin"),
                        )),
                  ),
                  /**
                   * Egg
                   */
                  PopularFoodsWidget(screenWidth: screenHeight)
                ],
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
