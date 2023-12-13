import '../models/product_model.dart';


class WishlistItems {
  // Private constructor
  WishlistItems._privateConstructor();

  List<ProductModel> wishlistItems = [];

  // Singleton instance
  static final WishlistItems _instance = WishlistItems._privateConstructor();

  // Getter to access the instance
  static WishlistItems get instance => _instance;


}