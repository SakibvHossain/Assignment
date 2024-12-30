import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() {
        if (controller.products.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(onRefresh: ()async{
          controller.fetchProductsFromAPI();
        }, child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: product.image,
                width: 50,
                height: 50,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(product.title),
              subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            );
          },
        ));
      }),
    );
  }
}