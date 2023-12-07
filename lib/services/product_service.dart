import 'dart:convert';

import '../models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getDataFromService() async {
    final response =
        await http.get(Uri.parse("http://192.168.28.92:3000/data"));

    if (response.statusCode == 200) {
      return (ProductModel.listOfProducts(jsonDecode(response.body)));
    } else {
      throw ("Unable to connect to server");
    }
  }
}
