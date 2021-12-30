import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/bottom_navigation_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/cart_page.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/user_dashboard.dart';
import 'package:welcome_loginsignup_dashboard/view/logout/logout_page.dart';

class HomePage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  HomePage({Key? key}) : super(key: key);

  final screens = [
    UserDashboard(),
    CartPage(),
    LogoutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.currentIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          // selectedIconTheme: IconThemeData(color: Colors.green),
          onTap: (index) {
            bottomNavigationController.changeIndex(index);
          },
          currentIndex: bottomNavigationController.currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Cart",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: "Logout",
              backgroundColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
