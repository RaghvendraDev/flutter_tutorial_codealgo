import 'package:flutter/material.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/login_background.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/textfield_decorator.dart';
import 'package:welcome_loginsignup_dashboard/view/login/components/userid_text_filed.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController useridController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String userIdErrorText = "User Id can not be empty";
  String userIdHintText = "Enter User Id";
  Color userIdHintTextColor = Colors.purple;
  IconData useridTextFieldPrefixIcon = Icons.person;
  Color useridTextFieldPrefixIconColor = Colors.purple;

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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
