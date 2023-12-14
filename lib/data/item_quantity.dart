import 'dart:ffi';

import '../models/product_model.dart';


class ItemQuantity {
  // Private constructor
  ItemQuantity._privateConstructor();

  Map<ProductModel,int> wishlistItems = {};
  int qty = 1;

  // Singleton instance
  static final ItemQuantity _instance = ItemQuantity._privateConstructor();

  // Getter to access the instance
  static ItemQuantity get instance => _instance;


}