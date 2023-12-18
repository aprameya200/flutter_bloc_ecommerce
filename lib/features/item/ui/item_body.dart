import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/data/constants.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/helper.dart';
import '../../../models/category_model.dart';
import '../../home/ui/bar_menu_widget.dart';

class ItemBody extends StatefulWidget {
  const ItemBody({super.key, required this.screenHeight, required this.item});

  final double screenHeight;
  final ProductModel item;

  @override
  State<ItemBody> createState() => _ItemBodyState();
}

class _ItemBodyState extends State<ItemBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          height: widget.screenHeight * 1,
          width: double.infinity,
          color: Color(0xFFF1EBEB),
          child: Column(
            children: [
              Container(
                height: widget.screenHeight * 0.83,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Hero(
                          tag: imageLinkStart + widget.item.imageName.toString(),
                          child: Image.network(
                              imageLinkStart + widget.item.imageName.toString(),
                              height: widget.screenHeight * 0.29),
                        )),
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
                      widget.item.name.toString(),
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
                      height: widget.screenHeight * 0.056,
                      child: ListView.builder(
                          itemCount: widget.item.ingredients!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: BarMenu(
                                categoryModel: CategoryModel(Helper.utf8convert(widget.item.ingredients![index]),""),
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
                      widget.item.description.toString(),
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
    );
  }
}
