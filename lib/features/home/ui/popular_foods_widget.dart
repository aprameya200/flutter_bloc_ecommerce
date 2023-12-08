import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularFoodsWidget extends StatelessWidget {
  const PopularFoodsWidget({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: screenWidth * 0.16,
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
              const Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salmon Eggs",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "PlayfairDisplay",
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$21.00",
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
              Flexible(
                  flex: 1,
                  child: Icon(Icons.favorite_border,
                      size: 32, color: Color(0x56111111)))
            ],
          ),
        ),
      ),
    );
  }
}
