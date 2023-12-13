import 'dart:convert';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final String? category;
  final List<dynamic>? ingredients;

  ProductModel(this.id, this.name, this.description, this.price, this.image, this.category, this.ingredients);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        json["id"], json["name"], json["description"], json["price"], "lol",json["category"],json["ingredients"]);
  }

  static List<ProductModel> listOfProducts(List body) {
    List<ProductModel> products = [];

    for (int i = 0; i < body.length; i++) {
      products.add(ProductModel(body[i]["id"], body[i]["name"],
          body[i]["description"], body[i]["price"], "DD",body[i]["category"],body[i]["ingredients"]));
    }

    return products;
  }
}
