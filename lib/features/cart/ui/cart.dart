import 'package:bloc_e_commerce/data/cart_items.dart';
import 'package:bloc_e_commerce/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_e_commerce/features/cart/ui/display_cart.dart';
import 'package:bloc_e_commerce/features/home/ui/popular_foods_widget.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/display_wishlist.dart';
import 'package:bloc_e_commerce/helpers/state_helper.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants.dart';
import '../../../data/wishlist_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartbloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartbloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double sumTotalAmount = ;

    return BlocConsumer<CartBloc, CartState>(
      bloc: cartbloc,
      buildWhen: (previous, current) => current is! CartActionState,
      listenWhen: (previous, current) => current is CartActionState,
      builder: (BuildContext context, CartState state) {
        if (CartStateHelper.isValidCartState(state)) {
          return Scaffold(
            backgroundColor: colorBakgroundWhite,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: colorBakgroundWhite,
                statusBarColor: colorBakgroundWhite, // Set the color you want
                // Set the color you want
              ),
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFFF1EBEB),
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 26, fontFamily: "LibreFranklin"),
                    ),
                    const Text("        ") //adjust this
                  ],
                ),
              ),
            ),
            body: Center(
              child: Container(
                color: Color(0xFFF1EBEB),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: ListView.builder(
                      itemCount: CartItems.instance.cartItems.length,
                      itemBuilder: (context, index) {
                        var key = CartItems.instance.cartItems.keys.toList();
                        var values =
                            CartItems.instance.cartItems.values.toList();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DisplayCart(
                            screenHeight: screenHeight,
                            product: key[index],
                            quantity: values[index]!,
                            cartbloc: cartbloc,
                          ),
                        );
                      }),
                ),
              ),
            ),
            bottomSheet: Container(
              color: colorBakgroundWhite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: screenHeight * 0.13,
                  decoration:
                      BoxDecoration(border: Border(top: BorderSide(width: 2))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 26, fontFamily: "PlayfairDisplay"),
                            ),
                            Text(
                                "\$" + CartItems.instance.totalPrice.toString(),
                                style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: "LibreFrankl"
                                        "in"))
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(colorRed),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Adjust the border radius as needed
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Checkout  ",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontFamily: "PlayfairDisplay",
                                          color: colorBakgroundWhite)),
                                  Icon(
                                    CarbonIcons.wireless_checkout,
                                    size: 34,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ))
                      ]),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text(
                "Invalid State",
                style: TextStyle(fontSize: 40),
              ),
            ),
          );
        }
      },
      listener: (BuildContext context, CartState state) {},
    );
  }
}
