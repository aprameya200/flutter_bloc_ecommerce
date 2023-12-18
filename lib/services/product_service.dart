import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_e_commerce/data/constants.dart';

import '../models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getDataFromService() async {
    final response =
        await http.get(Uri.parse("$address/data"));

    if (response.statusCode == 200) {
      return (ProductModel.listOfProducts(jsonDecode(response.body)));
    } else {
      throw ("Unable to connect to server");
    }
  }

}
