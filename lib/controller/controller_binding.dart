import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/cart_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/fav_counter_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/gender_selection_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(GenderSelectionController());
    Get.put(CartController());
    Get.put(FavCounterController());
  }
}
