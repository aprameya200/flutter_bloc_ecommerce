import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/helpers/helper.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/category_model.dart';
import '../../home/ui/bar_menu_widget.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item});

  final ProductModel item;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    ProductModel item = widget.item;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFB1454A),
          statusBarColor: Color(0xFFF1EBEB), // Set the color you want
    // Set the color you want
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF1EBEB),
        title:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.arrow_back,
                size: 35,),onPressed: () {Navigator.pop(context);},

              ),
              Icon(
                Icons.favorite_border_sharp,
                size: 35,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            height: screenHeight * 1,
            width: double.infinity,
            color: Color(0xFFF1EBEB),
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.83,
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
                        item.name.toString(),
                        maxLines: 1,
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
                            itemCount: item.ingredients!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: BarMenu(
                                  categoryModel: CategoryModel(Helper.utf8convert(item.ingredients![index]),""),
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
                      AutoSizeText(
                        item.description.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "LibreFranklin",
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                        maxLines: 7,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      bottomSheet: Container(
        height: screenHeight * 0.15,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFB1454A), // Background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ), // Border radius
        ),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$" + item.price.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "LibreFranklin",
                      fontSize: 25,
                      letterSpacing: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50)))),
                        onPressed: null,
                        child: const Text(
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
                    Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(150),
                                      bottomLeft: Radius.circular(150),
                                      bottomRight: Radius.circular(150),
                                      topRight: Radius.circular(150)))),
                          onPressed: () {print("Q");},
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.06,
              child: const ElevatedButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontFamily: "LibreFranklin"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ],
        )),
      ),
    );
  }
}
