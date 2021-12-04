import 'package:get/state_manager.dart';

class GenderSelectionController extends GetxController {
  var selectedGender = "".obs;

  onChnageGender(var gender) {
    selectedGender.value = gender;
  }
}
