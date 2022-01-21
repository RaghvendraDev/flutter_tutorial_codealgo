import 'package:get/state_manager.dart';

class CartController extends GetxController {
  var numOfItems = 1.obs;

  void removeItem() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }
}
