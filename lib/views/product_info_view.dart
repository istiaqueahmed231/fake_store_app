import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../view_models/controllers/product_info_view_controller.dart';

class ProductInfoView extends StatelessWidget {
  const ProductInfoView({super.key}); // Remove the old constructor

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final ProductInfoViewController controller = Get.put(ProductInfoViewController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Product Details", style: TextStyle(color: Colors.black)),
      ),
      body: Obx(() {
        final item = controller.product.value;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /// 🔹 Image Section
            SizedBox(
            height: 300,
            child: PageView.builder(
                itemCount: item.images?.length ?? 0,
                itemBuilder: (context, index) {
          return Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
          item.images![index],
          fit: BoxFit.cover,
          ),
          ),
          );
          },
          ),
        ),

        /// 🔹 Info Section
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
        item.title ?? "",
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
        "\$${item.price ?? ''}",
        style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepOrange,
        ),
        ),
        const SizedBox(height: 20),
        const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
        item.description ?? "",
        style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.5),
        ),
        const SizedBox(height: 30),
        // ... Add to Cart Button code [cite: 18-22]
        ],
        ),
        ),
        ],
        ),
        );
      }),
    );
  }
}