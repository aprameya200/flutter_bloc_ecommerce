import 'package:bloc_e_commerce/features/home/bloc/home_bloc.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionsState,
      buildWhen: (previous, current) => current is! HomeActionsState,
      listener: (context, state) {
        if (state == HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        }
      },
      builder: (context, state) {
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
                          size: 30,
                        ),
                        onPressed: () {
                          homebloc.add(HomeCartButtonNavigateEvent());
                        },
                      ),
                      Text(
                        "Kathmandu",
                        style: TextStyle(fontSize: 27),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                        onPressed: () {
                          homebloc.add(HomeWishlistButtonNavigateEvent());
                        },
                      )
                    ]),
              ),
            ),
          ),
          body: Container(
              color: Colors.purple,
              child: Center(
                  child: Text(
                    "This is the home page",
                    style: TextStyle(fontSize: 30),
                  ))),
        );
      },
    );
  }
}
