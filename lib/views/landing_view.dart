import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/view_models/controllers/landing_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../res/routes/route_names.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final LandingViewController controller = Get.put(LandingViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          top: 40,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "FAKE STORE".toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing:
                      4, // Adds that high-end "luxury" breathing room
                  color: Colors.black,
                  fontFamily: 'Montserrat', // Or any clean San-Serif font
                ),
              ),

              Expanded(
                child: Obx(() {
                  print(controller.products);
                  // if (controller.products.isEmpty) {
                  //   return Center(child: Text('no_data_found'));
                  // }

                  // if (controller.isLoading.value) {
                  //   return const CircularProgressIndicator();
                  // }

                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.products.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                    ProductModel product = controller.products[index];

                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(
                          RoutesNames.productInfoView,
                          arguments: product,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.images!.isNotEmpty
                                      ? product.images![0]
                                      : "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("\$${product.price}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      //body: Center(child: Text("landing View"),),
    );
  }
}
