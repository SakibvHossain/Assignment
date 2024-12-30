import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/service/impl/api_service_impl.dart';
import '../model/product_model.dart';

class NewScreenController extends GetxController{
  RxList allProducts = [].obs; //We can't define type because RxList is dynamic
  RxBool isLoading = false.obs;

  late ApiServiceImpl service;

  @override
  void onInit() {
    service = ApiServiceImpl();
    getProducts();
    super.onInit();
  }

  // Getting the product
  void getProducts() async {
    try {
      isLoading(true);
      http.Response products = await service.getProducts();
      if (products.statusCode == 200) {
        var decodeProducts = jsonDecode(products.body);

        // Clear the list because it can regenerate list again...
        allProducts.clear();

        for (var item in decodeProducts) {
          allProducts.add(ProductModel.fromJson(item));
        }

        Get.snackbar('Product Found', 'Product retrieve successful');
      } else {
        Get.snackbar('Product not found', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Product not found', '$e');
    } finally {
      isLoading(false);
    }
  }
}