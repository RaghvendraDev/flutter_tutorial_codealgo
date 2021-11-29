import 'package:flutter/material.dart';

import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';
import 'package:welcome_loginsignup_dashboard/view/login/login_page.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/signup.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/components/background.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/components/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Code Algo Family",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                "assets/images/undraw_Balloons.png",
                width: size.width * 0.7,
              ),
              CustomButton(
                buttonColor: MyTheme.loginButtonColor,
                buttontext: "LOGIN",
                textColor: Colors.white,
                handleButtonClick: () {
                  loginButtonClickHandler(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonColor: MyTheme.signupButtonColor,
                buttontext: "SIGNUP",
                textColor: Colors.black,
                handleButtonClick: () {
                  signUpButtonClickHandler(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginButtonClickHandler(BuildContext context) {
    print("Login Clicked");

    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => LoginPage()));
  }

  signUpButtonClickHandler(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
