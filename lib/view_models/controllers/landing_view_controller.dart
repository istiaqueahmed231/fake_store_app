import 'dart:convert';

import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/repository/landing_view_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LandingViewController extends GetxController {
  final LandingViewRepository landingViewRepository = LandingViewRepository();

  var products = <ProductModel>[].obs;
  var productImages = <String>[].obs;
   var isLoading=false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();

    //super onInit();
  }

  Future<void> getProducts() async {
    isLoading.value=true;
    try{
      final http.Response response=await landingViewRepository.getProducts();
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        products.value =
            (data as List)
                .map((item) => ProductModel.fromJson(item))
                .toList();
        //print(products);


      }
    }

    catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false; // Set loading to false regardless of result
    }
  }
}
