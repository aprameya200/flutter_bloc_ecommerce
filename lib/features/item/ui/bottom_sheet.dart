import 'package:bloc/bloc.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/item_bloc.dart';
import 'button_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget(
      {super.key,
      required this.screenHeight,
      required this.item,
      required this.itembloc, required this.quantity, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  final ProductModel item;
  final Bloc itembloc;
  final int quantity;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {

    double amount = widget.item.price! * widget.quantity.toDouble();

    return Container(
      height: widget.screenHeight * 0.15,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFB1454A), // Background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ), // Border radius
      ),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$$amount",
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
                  style: QuantityToggler.displayButton(),
                  onPressed: () {
                    if(widget.quantity > 1){
                      widget.itembloc.add(ItemSubtractQuantityButtonClickedEvent());
                    }
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
              const SizedBox(
                width: 15,
              ),
              Text(widget.quantity.toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.white)),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  style: QuantityToggler.displayButton(),
                  onPressed: () {
                      widget.itembloc.add(ItemAddQuantityButtonClickedEvent());
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  )),
            ],
          )
        ],
      ),
      SizedBox(
        width: widget.screenWidth * 0.7,
        height: widget.screenHeight * 0.06,
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
            ),
    );
  }
}
