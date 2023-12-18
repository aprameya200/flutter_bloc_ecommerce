import 'package:bloc_e_commerce/data/cart_items.dart';
import 'package:bloc_e_commerce/data/constants.dart';
import 'package:bloc_e_commerce/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayCart extends StatelessWidget {
  const DisplayCart(
      {super.key,
      required this.screenHeight,
      required this.product,
      required this.quantity,
      required this.cartbloc});

  final double screenHeight;
  final ProductModel product;
  final int quantity;
  final CartBloc cartbloc;

  @override
  Widget build(BuildContext context) {
    double totalAmount = product.price! * quantity.toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Dismissible(
        onDismissed: (direction) {
          cartbloc.add(CartDeleteItemFromCartEvent(product));
        },
        key: Key("s"),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CarbonIcons.delete,
                size: 50,color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Delete",
                style: TextStyle(fontSize: 40,color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                CarbonIcons.delete,
                size: 50,color: Colors.white,
              )
            ],
          ),
        ),
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFFF9F9F9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center ,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Image.network(
                    imageLinkStart + product.imageName.toString(),
                    height: 100,
                    width: 100,
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "PlayfairDisplay",
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$${product.price.toString()}",
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "LibreFranklin",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(),
                Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: IconButton(
                              padding: const EdgeInsets.only(top: 0),
                              onPressed: () {
                                cartbloc.add(
                                    CartAddItemQuantityButtonClickedEvent(
                                        product));
                              },
                              icon: const Icon(
                                CarbonIcons.add,
                                size: 30,
                              )),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "x",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "LibreFranklin",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: "PlayfairDisplay",
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Expanded(
                            child: IconButton(
                                padding: EdgeInsets.only(top: 0),
                                onPressed: () {
                                  cartbloc.add(
                                      CartSubtractItemQuantityButtonClickedEvent(
                                          product));
                                },
                                icon: const Icon(
                                  CarbonIcons.subtract,
                                  size: 30,
                                ))),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
