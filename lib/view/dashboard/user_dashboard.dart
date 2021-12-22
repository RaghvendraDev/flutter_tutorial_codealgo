import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_loginsignup_dashboard/controller/login_controller.dart';
import 'package:welcome_loginsignup_dashboard/model/login_singelton.dart';
import 'package:welcome_loginsignup_dashboard/model/user_model_list.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/component/dashboard_background.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/component/user_details_card.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  String name = "";
  bool isDataLoadComplete = false;
  LoginController loginController = Get.find();

  @override
  void initState() {
    // TODO: implement initState

    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardBackground(
        // child: Obx(
        //   () => loginController.isDataReadingCompleted.value == true
        //       ? UserDetailsCard(
        //           name: UserDataList.name,
        //           email: UserDataList.email,
        //           mobile: UserDataList.mobile,
        //           gender: UserDataList.gender,
        //           profilePic: UserDataList.profilePic,
        //         )
        //       : CircularProgressIndicator(),
        // ),
        // child: UserDetailsCard(
        //   email: LoginSingelton.getUserEmail(),
        //   gender: LoginSingelton.getUserGender(),
        //   mobile: LoginSingelton.getUserMobile(),
        //   name: LoginSingelton.getUserName(),
        //   profilePic: LoginSingelton.getUserProfilePic(),
        // ),

        child: isDataLoadComplete
            ? Text(
                name,
                style: TextStyle(
                  fontSize: 40,
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  Future<void> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapData = json.decode(preferences.getString("userdata")!);

    setState(() {
      isDataLoadComplete = true;
      name = mapData['userName'];
    });
  }
}
