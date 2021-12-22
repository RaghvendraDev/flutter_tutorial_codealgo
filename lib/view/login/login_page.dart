import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/login_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';
import 'package:welcome_loginsignup_dashboard/view/dashboard/user_dashboard.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/login_background.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/password_field.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/textfield_decorator.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/userid_text_filed.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/signup.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/components/custom_button.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController useridController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String userIdErrorText = "Mobile number Can not be empty";
  String userIdHintText = "Enter Mobile Number";
  Color userIdHintTextColor = Colors.purple;
  IconData useridTextFieldPrefixIcon = Icons.phone;
  Color useridTextFieldPrefixIconColor = Colors.purple;

  LoginController loginController = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Login.png"),
              const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldDecorator(
                      child: UserIdTextField(
                        useridController: useridController,
                        userIdErrorText: userIdErrorText,
                        userIdHintText: userIdHintText,
                        userIdHintTextColor: userIdHintTextColor,
                        useridTextFieldPrefixIcon: useridTextFieldPrefixIcon,
                        useridTextFieldPrefixIconColor:
                            useridTextFieldPrefixIconColor,
                        onUseridValueChange: (value) {
                          //print(value);
                        },
                      ),
                    ),
                    TextFieldDecorator(
                      child: UserPassTextField(
                        userPassController: passController,
                        userPassErrorText: "Password can not be empty",
                        userPassHintText: "Enter Password",
                        userPassHintTextColor: Colors.purple,
                        userPassTextFieldPrefixIcon: Icons.lock,
                        userPassTextFieldPrefixIconColor: Colors.purple,
                        suffixIcon: Icons.visibility_off,
                        suffixIconColor: Colors.purple,
                        onUserPassValueChange: (value) {
                          print("pass value $value");
                        },
                      ),
                    ),
                    Obx(
                      () => loginController.isDataSubmitting.value == false
                          ? CustomButton(
                              buttonColor: MyTheme.loginButtonColor,
                              buttontext: "LOGIN",
                              textColor: Colors.white,
                              handleButtonClick: () {
                                userLogin();
                              },
                            )
                          : CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont have account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void userLogin() {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      // print(useridController.text);
      // print(passController.text);

      loginController.loginWithDetail(
          useridController.text, passController.text);
    }
    {
      return null;
    }
  }
}
