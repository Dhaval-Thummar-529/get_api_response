import 'dart:convert';
import '../Model/Product.dart';
import 'package:http/http.dart' as http;

class Api {
  List<Product> parsedProducts(String responseBody) {
    final parsedProducts = json.decode(responseBody);
    return parsedProducts
        .map<Product>((json) => Product.fromJson(json))
        .toList();
  }

  Future<List<Product>> fetchProducts() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return parsedProducts(response.body);
    } else {
      throw Exception("Unable to fetch product from API");
    }
  }
}
