import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/gender_selection_controller.dart';

class GenderSelection extends StatelessWidget {
  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());

  GenderSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            child: Text(
              "Gender",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          Row(
            children: [
              Obx(
                () => Radio(
                  value: "Male",
                  groupValue: genderSelectionController.genderValue.value,
                  onChanged: (value) {
                    genderSelectionController.changeGenderStatus();
                  },
                  activeColor: Colors.purple,
                  fillColor: MaterialStateProperty.all(Colors.purple),
                ),
              ),
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Obx(() => Radio(
                    value: "Female",
                    groupValue: genderSelectionController.genderValue.value,
                    onChanged: (value) {
                      genderSelectionController.changeGenderStatus();
                    },
                    activeColor: Colors.purple,
                    fillColor: MaterialStateProperty.all(Colors.purple),
                  )),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}