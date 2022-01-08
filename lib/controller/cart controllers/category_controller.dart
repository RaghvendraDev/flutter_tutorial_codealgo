import 'package:get/state_manager.dart';

class CategoryController extends GetxController {
  var currentIndex = 0.obs;

  List<String> categoryList = [
    "Jacket",
    "Over coat",
    "Bags",
    "Hand bags",
    "Perfume",
    "Pants",
    "Jeans",
    "Top"
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
