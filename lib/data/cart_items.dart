import '../models/product_model.dart';


class CartItems {
  // Private constructor
  CartItems._privateConstructor();

  Map<ProductModel,dynamic> cartItems = {};

  double totalPrice = 0;

  // Singleton instance
  static final CartItems _instance = CartItems._privateConstructor();

  // Getter to access the instance
  static CartItems get instance => _instance;

  getTotalPriceOfCart(){

    double totalPrice = 0;

    cartItems.forEach((product, quantity) {
      totalPrice += (product.price! * quantity!);
    });

    this.totalPrice = totalPrice;
  }


}