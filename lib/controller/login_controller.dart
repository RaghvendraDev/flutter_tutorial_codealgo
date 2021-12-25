import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_loginsignup_dashboard/model/custom_webservices.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/model/login_singelton.dart';
import 'package:welcome_loginsignup_dashboard/model/user_data_model.dart';

import 'package:welcome_loginsignup_dashboard/model/user_model_list.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/user_dashboard.dart';

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
      isDataSubmitting.value = false;
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['rMsg'] == "success") {
        //1. Model

        //first way

        UserDataList.profilePic =
            UserDataModel.fromMap(responseData).rUserProfileImg;

        UserDataList.name = UserDataModel.fromMap(responseData).rUserName;

        UserDataList.email = UserDataModel.fromMap(responseData).rUserEmail;

        UserDataList.mobile = UserDataModel.fromMap(responseData).rUserMobile;

        UserDataList.gender = UserDataModel.fromMap(responseData).rUserGender;

        //second way

        // UserDataList.profilePic = responseData['rUserProfileImg'];

        // UserDataList.name = responseData['rUserName'];

        // UserDataList.email = responseData['rUserEmail'];

        // UserDataList.mobile = responseData['rUserMobile'];

        // UserDataList.gender = responseData['rUserGender'];

        //TODO: //2. Singleton class

        // LoginSingelton.setUserName(responseData['rUserName']);
        // LoginSingelton.setUserEmail(responseData['rUserEmail']);
        // LoginSingelton.setUserMobile(responseData['rUserMobile']);
        // LoginSingelton.setUserGender(responseData['rUserGender']);
        // LoginSingelton.setUserProfilePic(responseData['rUserProfileImg']);

        //TODO: 3. Shared Prefrences

        // SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();

        // Map<String, String> data = {
        //   "userProfile": responseData['rUserProfileImg'],
        //   "userName": responseData['rUserName'],
        //   "userEmail": responseData['rUserEmail'],
        //   "userMobile": responseData['rUserMobile'],
        //   "userGender": responseData['rUserGender'],
        // };

        // sharedPreferences.setString("userdata", json.encode(data));

        isDataReadingCompleted.value = true;

        Get.to(() => UserDashboard());
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
}
