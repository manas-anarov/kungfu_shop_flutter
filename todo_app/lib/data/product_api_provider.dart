import 'dart:convert';
import 'package:todo_app/data/models/product.dart';

import 'package:http/http.dart' as http;

class ProductProvider {
  static String mainUrl = "http://192.168.0.103:8000";
  var listUrl = '$mainUrl/api/v1/list/';
  // var detailUrl = '$mainUrl/api/v1/detail/nike/';
  var detailUrl = '$mainUrl/api/v1/detail/';
  // var url = mainUrl + listUrl;

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(listUrl));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }

  Future<Product> getProductDetail(String product_slug) async {
    final response = await http.get(Uri.parse('$detailUrl$product_slug'));

    if (response.statusCode == 200) {
      print("in response");
      final dynamic userJson = json.decode(response.body);

      print(response.body.toString());
      return Product.fromJson(userJson);
    } else {
      throw Exception('Error fetching users');
    }
  }
}
