import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayWishlistWidget extends StatelessWidget {
  const DisplayWishlistWidget({super.key, required this.screenHeight, required this.product});

  final double screenHeight;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
            children: [
              Flexible(
                flex: 2,
                child: Image.asset(
                  "assets/egg.png",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$" + product.price.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "LibreFranklin",
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFA600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "5.0",
                                style: TextStyle(
                                    color: Color(0x56111111),
                                    fontSize: 14,
                                    fontFamily: "LibreFranklin",
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
