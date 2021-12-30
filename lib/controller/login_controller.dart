import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_loginsignup_dashboard/model/custom_webservices.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/model/user_model_list.dart';
import 'package:welcome_loginsignup_dashboard/view/home/home_page.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/welcome_page.dart';

class LoginController extends GetxController {
  var isDataSubmitting = false.obs;
  var isDataReadingCompleted = false.obs;

  loginWithDetail(String id, String pass) async {
    isDataSubmitting.value = true;

    Map<String, dynamic> dataBody = {
      CustomWebServices.USER_MOBILE: id,
      CustomWebServices.USER_PASS: pass,
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.login_url),
        body: dataToSend);

    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isLoggedin", true);
      preferences.setString("userid", id);

      isDataSubmitting.value = false;

      Get.off(() => HomePage());

      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['rMsg'] == "success") {
        isDataReadingCompleted.value = true;
      } else {
        Get.snackbar(
          "Login Failed",
          "Invalid User Id / Password",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    } else {
      isDataSubmitting.value = false;
      Get.snackbar(
        "Login Failed",
        "API Problem",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }

  Future<void> logout() async {
    UserDataList.email = "";
    UserDataList.name = "";
    UserDataList.mobile = "";
    UserDataList.profilePic = "";
    UserDataList.gender = "";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedin", false);
    Get.off(() => WelcomePage());
  }
}
