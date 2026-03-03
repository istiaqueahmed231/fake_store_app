import 'package:fake_store/models/product_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductInfoViewController  extends GetxController{
  var product = ProductModel().obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the passed ProductModel from arguments
    if (Get.arguments != null) {
      product.value = Get.arguments as ProductModel;
    }
  }
}