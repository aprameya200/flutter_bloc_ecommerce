import 'package:bloc_e_commerce/features/home/ui/popular_foods_widget.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/display_wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/constants.dart';
import '../../../data/wishlist_items.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorBakgroundWhite,
          statusBarColor: colorBakgroundWhite,
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
                "Wishlist",
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
              itemCount: WishlistItems.instance.wishlistItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DisplayWishlistWidget(screenHeight: screenHeight, product: WishlistItems.instance.wishlistItems[index],),
                );
              }),
        ),
      ),
    );
  }
}
