import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/model/custom_webservices.dart';
import 'package:http/http.dart' as http;
import 'package:welcome_loginsignup_dashboard/view/login/login_page.dart';

class SignUpController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;

  var profileImageBase64;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userGender = "";

  var isSendingData = false.obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;

    final bytes = File(profilePicPath.value).readAsBytesSync();
    profileImageBase64 = base64.encode(bytes);
  }

  void signUpUser(String name, String email, String mobile, String pass,
      String rePass, String gender) {
    if (isProficPicPathSet.value == false) {
      Get.snackbar(
        "Sign Up Failed",
        "Please Capture/Select Profile Picture",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (pass != rePass) {
      Get.snackbar(
        "Sign Up Failed",
        "Password does not match",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "Sign Up Failed",
        "Email Id is not valid",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else {
      userName = name;
      userEmail = email;
      userMobile = mobile;
      userPass = pass;
      userGender = gender;

      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  Future<void> sendUserDataToServer() async {
    isSendingData.value = true;

    Map<String, dynamic> dataBody = {
      CustomWebServices.PROFILE_IMAGE: profileImageBase64,
      CustomWebServices.USER_NAME: userName,
      CustomWebServices.USER_EMAIL: userEmail,
      CustomWebServices.USER_MOBILE: userMobile,
      CustomWebServices.USER_PASS: userPass,
      CustomWebServices.USER_GENDER: userGender,
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);

    // print(response);

    if (response.statusCode == 200) {
      isSendingData.value = false;
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['r_msg'] == "success") {
        Get.to(LoginPage());
      } else if (responseData['r_msg'] == "failed") {
        Get.snackbar(
          "Sign Up Failed",
          "Server Problem Occured",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      } else if (responseData['r_msg'] == "mobile number already exist") {
        Get.snackbar(
          "Sign Up Failed",
          "You have alreday registered",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    } else {
      isSendingData.value = false;
      Get.snackbar(
        "Sign Up Failed",
        "API Problem",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
