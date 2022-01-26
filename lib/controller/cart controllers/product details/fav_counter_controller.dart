import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';

class FavCounterController extends GetxController {
  var numOfItems = 0.obs;

  var favList = <ProductModel>[].obs;

  void addFavItemToList(ProductModel product) {
    if (!favList.contains(product)) {
      favList.add(product);
      numOfItems++;
    } else {
      Get.snackbar(
        "Already There",
        "You Already Liked this Item!!",
        backgroundColor: Color(int.parse(product.color)),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        borderColor: Colors.indigo,
        borderRadius: 10,
        borderWidth: 2,
        barBlur: 0,
      );
    }
  }
}
