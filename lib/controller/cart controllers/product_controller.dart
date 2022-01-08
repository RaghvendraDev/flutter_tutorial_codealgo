import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isDataLoadingCompleetd = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchData();
  }

  Future<void> fetchData() async {
    var productjson =
        await rootBundle.loadString("assets/json/tutorial_product.json");

    var decodeData = jsonDecode(productjson);

    // print(decodeData);

    products.value =
        List.from(decodeData).map((e) => ProductModel.fromMap(e)).toList();

    isDataLoadingCompleetd.value = true;
  }

  void destroy() {
    products.value = [];
  }
}
