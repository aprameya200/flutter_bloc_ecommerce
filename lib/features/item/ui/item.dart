import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/category_model.dart';
import '../../home/ui/bar_menu_widget.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    List<CategoryModel> cat = [
      CategoryModel("All", "assets/all.png"),
      CategoryModel("Sushi", "assets/sushi.png"),
      CategoryModel("Ramen", "assets/ramen.png"),
      CategoryModel("Chicken", "assets/chicken-leg.png"),
    ];

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFB1454A), // Set the color you want
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF1EBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1EBEB),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                size: 35,
              ),
              Icon(
                Icons.favorite_border_sharp,
                size: 35,
              )
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          height: screenHeight * 0.8,
          width: double.infinity,
          color: Color(0xFFF1EBEB),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset("assets/sushi.png",
                      height: screenHeight * 0.29)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  )
                ],
              ),
              AutoSizeText(
                "Original Sushi",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Ingredients",
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: "LibreFranklin",
                    fontWeight: FontWeight.w300),
              ),
              Container(
                height: screenHeight * 0.056,
                child: ListView.builder(
                    itemCount: cat.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: BarMenu(
                          categoryModel: cat[index],
                          backgroundColor: Colors.black,
                        ),
                      );
                    }),
              ),
              const Text(
                "Description",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "LibreFranklin",
                    fontWeight: FontWeight.w300),
              ),
              const AutoSizeText(
                "Indulge in the rich and hearty flavors of Miso Ramen. This ramen variety boasts a broth made with fermented soybean paste, creating a robust and complex taste. Served with chewy ramen noodles, fresh bean sprouts, corn, and slices of succulent chashu pork, it's a satisfying bowl of comfort",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "LibreFranklin",
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
                maxLines: 7,
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
      bottomSheet: Container(
        height: screenHeight * 0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFB1454A), // Background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ), // Border radius
        ),
        child: Container(
            child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$42.33",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "LibreFranklin",
                      fontSize: 18,
                      letterSpacing: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: null,
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Text("2",
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: null,
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
            ElevatedButton(onPressed: null, child: Row(children: [Text("Buy Now"),Icon(Icons.arrow_forward)],))
          ],
        )),
      ),
    );
  }
}
