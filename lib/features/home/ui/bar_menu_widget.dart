import 'package:bloc_e_commerce/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarMenu extends StatelessWidget {
  const BarMenu({super.key,required this.categoryModel, required this.backgroundColor});

  final CategoryModel categoryModel ;
  final Color backgroundColor ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFFF9F9F9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  categoryModel.imageSource,
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  categoryModel.catagoryName,
                  style:
                      TextStyle(fontFamily: "LibreFranklin", color: backgroundColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
