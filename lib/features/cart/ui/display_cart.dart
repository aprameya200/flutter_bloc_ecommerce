import 'package:bloc_e_commerce/data/constants.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayCart extends StatelessWidget {
  const DisplayCart(
      {super.key,
      required this.screenHeight,
      required this.product,
      required this.quantity});

  final double screenHeight;
  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {

    double totalAmount = product.price! * quantity.toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFF9F9F9),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toString(),
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "PlayfairDisplay",
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$$totalAmount",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "LibreFranklin",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "x",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "LibreFranklin",
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " " + quantity.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "PlayfairDisplay",
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
