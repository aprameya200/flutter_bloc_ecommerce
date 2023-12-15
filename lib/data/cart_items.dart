import '../models/product_model.dart';


class CartItems {
  // Private constructor
  CartItems._privateConstructor();

  Map<ProductModel,dynamic> cartItems = {};

  // Singleton instance
  static final CartItems _instance = CartItems._privateConstructor();

  // Getter to access the instance
  static CartItems get instance => _instance;


}