import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:welcome_loginsignup_dashboard/controller/gender_selection_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/login_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/cart_page.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';
import 'package:welcome_loginsignup_dashboard/view/home/home_page.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/welcome_page.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  LoginController loginController = Get.put(LoginController());
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  var isLoggedIn = (preferences.getBool("isLoggedin") == null)
      ? false
      : preferences.getBool("isLoggedin");

  // print("Here $isLoggedIn");

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final isLoggedIn;
  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());
  MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // home: isLoggedIn ? HomePage() : WelcomePage(),
      home: CartPage(),
    );
  }
}
