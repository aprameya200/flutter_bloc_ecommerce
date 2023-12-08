import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 12),
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFB1454A),
              borderRadius:
                  BorderRadius.circular(20.0), // Set the border radius here
            ),
            height: screenHeight * 0.19,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Get 32% Promo",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PlayfairDisplay"),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white38)),
                        onPressed: () {},
                        child: Text(
                          "Buy Food",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              fontFamily: "LibreFranklin"),
                        ))
                  ],
                ),
                Container(
                    child: LottieBuilder.asset(
                  "assets/sushi-offer.json",
                  height: 200,
                  width: 130,
                ))
              ],
            )),
      ),
    );
  }
}
