import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:home_screen/utils/service/impl/api_service_impl.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  late Box<Product> productBox;

  RxBool isLoading = false.obs;
  late ApiServiceImpl apiServiceImpl;

  @override
  void onInit() {
    apiServiceImpl = ApiServiceImpl();
    super.onInit();
    productBox = Hive.box<Product>('products');
    if (productBox.isEmpty) {
      fetchProductsFromAPI();
    } else {
      loadProductsFromHive();
    }
  }

  void loadProductsFromHive() {
    products.value = productBox.values.toList();
  }

  Future<void> fetchProductsFromAPI() async {
    try {
      isLoading(true);
      final response = await apiServiceImpl.getProducts();
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final fetchedProducts = data.map((item) => Product.fromJson(item)).toList();

        // Save products to Hive
        for (var product in fetchedProducts) {
          productBox.put(product.id, product);
        }
        // Update the observable list
        products.value = fetchedProducts;
      } else {
        Get.snackbar('Error', 'Failed to fetch products. Status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products. Error: $e');
    }finally{
      isLoading(false);
    }
  }
}