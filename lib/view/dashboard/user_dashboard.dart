import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_loginsignup_dashboard/controller/dahboard_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/login_controller.dart';
import 'package:welcome_loginsignup_dashboard/model/login_singelton.dart';
import 'package:welcome_loginsignup_dashboard/model/user_model_list.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/component/dashboard_background.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/component/user_details_card.dart';

class UserDashboard extends StatelessWidget {
  DashboardController dashboardController = Get.put(DashboardController());

  LoginController loginController = Get.find();
  UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dashboardController.loadUserData();
    return Scaffold(
      body: DashboardBackground(
        child: Obx(
          () => dashboardController.isDataReadingCompleted.value == true
              ? UserDetailsCard(
                  name: UserDataList.name,
                  email: UserDataList.email,
                  mobile: UserDataList.mobile,
                  gender: UserDataList.gender,
                  profilePic: UserDataList.profilePic,
                )
              : CircularProgressIndicator(),
        ),
        // child: UserDetailsCard(
        //   email: LoginSingelton.getUserEmail(),
        //   gender: LoginSingelton.getUserGender(),
        //   mobile: LoginSingelton.getUserMobile(),
        //   name: LoginSingelton.getUserName(),
        //   profilePic: LoginSingelton.getUserProfilePic(),
        // ),
      ),
    );
  }
}