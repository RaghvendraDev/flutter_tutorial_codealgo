import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:welcome_loginsignup_dashboard/controller/bottom_navigation_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/cart_page.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';
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
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     type: BottomNavigationBarType.shifting,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white70,
      //     showUnselectedLabels: true,
      //     // selectedIconTheme: IconThemeData(color: Colors.green),
      //     onTap: (index) {
      //       bottomNavigationController.changeIndex(index);
      //     },
      //     currentIndex: bottomNavigationController.currentIndex.value,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.deepPurple,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shop),
      //         label: "Cart",
      //         backgroundColor: Colors.green,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.logout,
      //         ),
      //         label: "Logout",
      //         backgroundColor: Colors.purple,
      //       ),
      //     ],
      //   ),
      // ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MyTheme.defaultPadding,
              horizontal: MyTheme.defaultPadding),
          child: GNav(
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.shop,
                text: "Cart",
              ),
              GButton(
                icon: Icons.logout,
                text: "Logout",
              )
            ],
            activeColor: Colors.black,
            tabBackgroundColor: Colors.blue,
            tabActiveBorder: Border.all(color: Colors.purple, width: 3),
            color: Colors.orange,
            haptic: true,
            gap: 10,
            iconSize: 30,
            tabShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
              ),
            ],
            duration: Duration(milliseconds: 200),
            curve: Curves.decelerate,
            rippleColor: Colors.blue,
            tabBorder: Border.all(color: Colors.orange),
            hoverColor: Colors.purple,
            onTabChange: (value) {
              bottomNavigationController.changeIndex(value);
            },
          ),
        ),
      ),
    );
  }
}
