import 'package:bloc_e_commerce/data/cart_items.dart';
import 'package:bloc_e_commerce/features/cart/ui/display_cart.dart';
import 'package:bloc_e_commerce/features/home/ui/popular_foods_widget.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/display_wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/constants.dart';
import '../../../data/wishlist_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Cart",
                style: TextStyle(fontSize: 26, fontFamily: "LibreFranklin"),
              ),
              Text("        ") //adjust this
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Color(0xFFF1EBEB),
          child: ListView.builder(
              itemCount: CartItems.instance.cartItems.length,
              itemBuilder: (context, index) {
                var key = CartItems.instance.cartItems.keys.toList();
                var values = CartItems.instance.cartItems.values.toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DisplayCart(screenHeight: screenHeight, product: key[index], quantity: values[index],),
                );
              }),
        ),
      ),
    );
  }
}
