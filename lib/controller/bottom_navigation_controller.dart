import 'package:get/state_manager.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;
  void changeIndex(var _index) {
    currentIndex.value = _index;
  }
}
