import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const registerUrl = 'https://mediadwi.com/api/latihan/register-user';
  static const loginUrl = 'https://mediadwi.com/api/latihan/login';
  static const productsUrl = 'https://fakestoreapi.com/products';

  static Future<http.Response> register(Map body) async {
    return await http.post(Uri.parse(registerUrl), body: body);
  }

  static Future<http.Response> login(Map body) async {
    return await http.post(Uri.parse(loginUrl), body: body);
  }

  static Future<List<dynamic>> fetchProducts() async {
    final res = await http.get(Uri.parse(productsUrl));
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as List<dynamic>;
    }
    throw Exception('Failed to load products');
  }
}
