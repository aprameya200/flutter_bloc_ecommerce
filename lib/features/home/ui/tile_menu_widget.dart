import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/wishlist_items.dart';

import '../bloc/home_bloc.dart';

class TileMenu extends StatefulWidget {
  const TileMenu(
      {super.key,
      required this.productModel,
      required this.screenWidth,
      required this.screenHeight,
      required this.homebloc});

  final ProductModel productModel;
  final double screenWidth;
  final double screenHeight;
  final HomeBloc homebloc;

  @override
  State<TileMenu> createState() => _TileMenuState();
}

class _TileMenuState extends State<TileMenu> {
  @override
  Widget build(BuildContext context) {
    Color isInWishlist = Colors.black;
    Icon icon = Icon(Icons.favorite_border_sharp,color: isInWishlist,size: 30,);

    for (int i = 0; i < WishlistItems.instance.wishlistItems.length; i++) {

      print(WishlistItems.instance.wishlistItems[i].name.toString() + " from loop");

      if (WishlistItems.instance.wishlistItems[i].name ==
          widget.productModel.name) {

        print("Yes Print");
        isInWishlist = Colors.red;
        icon = Icon(Icons.favorite,color: isInWishlist, size: 30,);

      }else{
      }
    }

    // Color isInWishlist = WishlistItems.instance.wishlistItems.contains(widget.productModel) ? Colors.red : Colors.black;

    // print(WishlistItems.instance.wishlistItems
    //         .contains(widget.productModel)
    //         .toString() +
    //     " Does contain");
    //
    // print(WishlistItems.instance.wishlistItems);

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          //padding of entire card
          child: Container(
            width: widget.screenWidth * 0.48,
            height: widget.screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFF9F9F9),
            ),
            padding: EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        getImage(widget.productModel.category.toString()),
                        height: widget.screenHeight * 0.12,
                        width: 115,
                      ),
                      InkWell(
                        child: icon,
                        onTap: () {
                          widget.homebloc.add(
                              HomeProductAddToWishlistButtonClickedEvent(
                                  widget.productModel));
                          setState(() {
                            isInWishlist = Colors.red;
                          });
                        },
                      )
                    ],
                  ),
                  AutoSizeText(
                    widget.productModel.name.toString(),
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: widget.screenHeight * 0.018,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${widget.productModel.price}",
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "LibreFranklin",
                              fontWeight: FontWeight.w500)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffe18414),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4.8",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  String getImage(String cat) {
    switch (cat) {
      case "sushi":
        return "assets/${randomizer(cat)}.png";
      case "ramen":
        return "assets/${randomizer(cat)}.png";
      case "chicken":
        return "assets/chicken-leg.png";
      default:
        return "assets/sushi.png";
    }
  }

  String randomizer(String name) {
    List namesSushi = [
      "sushi",
      "egg",
      "yellow-sushi",
      "two-sushi",
      "more_eggs",
      "black-ramen"
    ];
    List namesRamen = ["ramen", "black-ramen", "egg-ramen"];

    final random = Random();

    if (name == "sushi") {
      final randomIndex = random.nextInt(namesSushi.length);
      return namesSushi[randomIndex];
    } else if (name == "ramen") {
      final randomIndex = random.nextInt(namesRamen.length);
      return namesRamen[randomIndex];
    } else {
      final randomIndex = random.nextInt(namesRamen.length);
      return namesRamen[randomIndex];
    }
  }
}
