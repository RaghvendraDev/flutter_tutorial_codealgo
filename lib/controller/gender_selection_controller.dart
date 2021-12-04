import 'package:get/state_manager.dart';

class GenderSelectionController extends GetxController {
  var genderValue = "".obs;

  changeGenderStatus() {
    if (genderValue.value == "Male") {
      genderValue.value = "Female";
    } else {
      genderValue.value = "Male";
    }
  }
}
