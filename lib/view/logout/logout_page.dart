import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/login_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/cart_page_background.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/components/custom_button.dart';

class LogoutPage extends StatelessWidget {
  LoginController loginController = Get.find();
  LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Logout Page",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            buttonColor: Colors.purple,
            buttontext: "Logout",
            textColor: Colors.white,
            handleButtonClick: () {
              loginController.logout();
            },
          ),
        ],
      )),
    );
  }
}
