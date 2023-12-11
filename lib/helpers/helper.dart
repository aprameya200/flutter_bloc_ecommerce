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
}