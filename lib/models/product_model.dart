import 'dart:convert';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;

  ProductModel(this.id, this.name, this.description, this.price, this.image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        json["id"], json["name"], json["description"], json["price"], "lol");
  }

  static List<ProductModel> listOfProducts(List body) {
    List<ProductModel> products = [];

    for (int i = 0; i < body.length; i++) {
      products.add(ProductModel(body[i]["id"], body[i]["name"],
          body[i]["description"], body[i]["price"], "DD"));
    }

    return products;
  }
}
