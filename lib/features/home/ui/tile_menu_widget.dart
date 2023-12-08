import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileMenu extends StatelessWidget {
  const TileMenu(
      {super.key,
      required this.productModel,
      required this.screenWidth,
      required this.screenHeight});

  final ProductModel productModel;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          //padding of entire card
          child: Container(
            width: screenWidth * 0.47,
            height: screenHeight * 0.25,
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
                        "assets/sushi.png",
                        height: 110,
                        width: 115,
                      ),
                      Icon(
                        Icons.favorite_border_sharp,
                        size: 30,
                        color: Color(0x56111111),
                      )
                    ],
                  ),
                  AutoSizeText(
                    productModel.name.toString(),
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: screenHeight * 0.018,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$" + productModel.price.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "LibreFranklin",
                              fontWeight: FontWeight.w500)),
                      Row(
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
}
