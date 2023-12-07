import 'package:bloc_e_commerce/features/home/bloc/home_bloc.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/wishlist.dart';
import 'package:bloc_e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';

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

  @override
  void initState() {
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
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
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          //checks the data type of the obj
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
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
                                "Kathmandu",
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "LibreFranklin"),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
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
              body: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the border radius here
                          ),
                          height: 160,
                          width: 350,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                    "Get 32% Promo",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontFamily: "PlayfairDisplay"),
                                  )),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("Buy Now"))
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return Scaffold();
        }
      },
    );
  }
}
