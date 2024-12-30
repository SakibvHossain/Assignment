import 'package:http/http.dart' as http;

import '../api_service.dart';

class ApiServiceImpl implements ApiService {
  final String _baseUrl = "https://fakestoreapi.com";

  @override
  Future<http.Response> getProducts() async {
    Uri uri = Uri.parse('$_baseUrl/products');
    http.Response getProductResponse = await http.get(uri);
    return getProductResponse;
  }
}