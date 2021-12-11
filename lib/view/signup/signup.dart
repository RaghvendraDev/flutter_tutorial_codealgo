import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/gender_selection_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/signup_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';
import 'package:welcome_loginsignup_dashboard/view/login/login_page.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/gender_selection.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/signup_background.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/signup_mobile_text.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/signup_profile_picture.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/signup_textfields.dart';
import 'package:welcome_loginsignup_dashboard/view/signup/components/signup_textfiled_decorator.dart';
import 'package:welcome_loginsignup_dashboard/view/welcome_page/components/custom_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());
  GenderSelectionController genderSelectionController = Get.find();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBackground(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SignUpProfilePicture(),
                const SizedBox(
                  height: 20,
                ),
                SignUpTextFieldDecorator(
                  child: SignUpUserIdTextField(
                    useridController: nameController,
                    userIdErrorText: "Name can not be empty",
                    userIdHintText: "Enter Name",
                    userIdHintTextColor: Colors.purple,
                    useridTextFieldPrefixIcon: Icons.person,
                    useridTextFieldPrefixIconColor: Colors.purple,
                    onUseridValueChange: (value) {},
                  ),
                ),
                SignUpTextFieldDecorator(
                  child: SignUpUserIdTextField(
                    useridController: emailController,
                    userIdErrorText: "Email Id can not be empty",
                    userIdHintText: "Enter Email Id",
                    userIdHintTextColor: Colors.purple,
                    useridTextFieldPrefixIcon: Icons.email,
                    useridTextFieldPrefixIconColor: Colors.purple,
                    onUseridValueChange: (value) {},
                  ),
                ),
                SignUpTextFieldDecorator(
                  child: SignUpMobileTextField(
                    useridController: mobileController,
                    userIdErrorText: "Mobile no not be empty",
                    userIdHintText: "Enter Mobile",
                    userIdHintTextColor: Colors.purple,
                    useridTextFieldPrefixIcon: Icons.phone,
                    useridTextFieldPrefixIconColor: Colors.purple,
                    onUseridValueChange: (value) {},
                  ),
                ),
                SignUpTextFieldDecorator(
                  child: SignUpUserIdTextField(
                    useridController: passController,
                    userIdErrorText: "Password not be empty",
                    userIdHintText: "Enter Password",
                    userIdHintTextColor: Colors.purple,
                    useridTextFieldPrefixIcon: Icons.lock,
                    useridTextFieldPrefixIconColor: Colors.purple,
                    onUseridValueChange: (value) {},
                  ),
                ),
                SignUpTextFieldDecorator(
                  child: SignUpUserIdTextField(
                    useridController: confirmPassController,
                    userIdErrorText: "Password not be empty",
                    userIdHintText: "Re-Enter Password",
                    userIdHintTextColor: Colors.purple,
                    useridTextFieldPrefixIcon: Icons.lock,
                    useridTextFieldPrefixIconColor: Colors.purple,
                    onUseridValueChange: (value) {},
                  ),
                ),
                SignUpTextFieldDecorator(
                  child: GenderSelection(),
                ),
                CustomButton(
                    buttonColor: MyTheme.loginButtonColor,
                    buttontext: "Sign Up",
                    textColor: Colors.white,
                    handleButtonClick: () {
                      signup();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account ?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid) {
      // print(nameController.text);
      // print(emailController.text);
      // print(mobileController.text);
      // print(passController.text);
      // print(confirmPassController.text);
      // print(genderSelectionController.selectedGender.value);

      signUpController.signUpUser(
          nameController.text,
          emailController.text,
          mobileController.text,
          passController.text,
          confirmPassController.text,
          genderSelectionController.selectedGender.value);
    } else {
      return null;
    }
  }
}
