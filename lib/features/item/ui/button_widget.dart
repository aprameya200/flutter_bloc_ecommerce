import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityToggler {

  static ButtonStyle displayButton() {
    return ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xff8f3337),
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50))));
  }
}
