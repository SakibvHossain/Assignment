import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/new_screen_controller.dart';
import '../../data/model/product_model.dart';
import '../widgets/product_card.dart';

class NewScreen extends StatelessWidget {
  NewScreen({super.key});

  final NewScreenController controller = Get.put(NewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        title: const Text(
          'Assignment 2',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff1E1E1E), // Set the background to black
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded to provide constraints to the ListView.builder
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return RefreshIndicator(onRefresh: () async {
                    controller.getProducts();
                  }, child: ListView.builder(
                    itemCount: controller.allProducts.length,
                    itemBuilder: (context, index) {
                      ProductModel model = controller.allProducts[index];
                      return ProductCard(
                        title: model.title!,
                        price: model.price!,
                        description: model.description!,
                        category: model.category!,
                        image: model.image!,
                        rate: model.rating!.rate!,
                        count: model.rating!.count!,
                      );
                    },
                  ));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}