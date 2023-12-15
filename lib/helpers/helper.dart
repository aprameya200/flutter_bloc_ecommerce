import 'dart:convert';

import '../models/product_model.dart';

class Helper{
  static List<ProductModel> filterProducts(String filterTerm, List<ProductModel> allProducts) {
    // Implement your filtering logic here

    if(filterTerm != "All"){
      return allProducts
          .where((product) => product.category!.toLowerCase().contains(filterTerm.toLowerCase()))
          .toList();
    }else{
      return allProducts;
    }

  }


  static String utf8convert(String text) { //converts the emoji utf string to readable emoji
    try{
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }on Exception catch (e) {
      return text;
    }

  }
}