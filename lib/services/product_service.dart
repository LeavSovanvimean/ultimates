import 'dart:convert';

import 'package:http/http.dart' as http;


class ProductServices {
  static var client = http.Client();

  static Future<Map<String, dynamic>?> getProduct() async {
    var response =
        await client.get(Uri.parse('https://dummyjson.com/products'));
//'http://192.168.1.104:8000/api/product'
    if (response.statusCode == 200) {
      //var data = response.body;
      //return productFromJson(data);

      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      return null;
    }
  }
}
