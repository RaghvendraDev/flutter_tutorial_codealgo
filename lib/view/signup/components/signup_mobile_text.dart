import 'package:flutter/material.dart';

class SignUpMobileTextField extends StatelessWidget {
  const SignUpMobileTextField({
    Key? key,
    required this.useridController,
    required this.userIdErrorText,
    required this.userIdHintText,
    required this.userIdHintTextColor,
    required this.useridTextFieldPrefixIcon,
    required this.useridTextFieldPrefixIconColor,
    required this.onUseridValueChange,
  }) : super(key: key);

  final TextEditingController useridController;
  final String userIdErrorText;
  final String userIdHintText;
  final Color userIdHintTextColor;
  final IconData useridTextFieldPrefixIcon;
  final Color useridTextFieldPrefixIconColor;
  final Function onUseridValueChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      controller: useridController,
      validator: (value) {
        if (value!.isEmpty) {
          return userIdErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        onUseridValueChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
        counterText: "",
        hintText: userIdHintText,
        hintStyle: TextStyle(
          color: userIdHintTextColor,
        ),
        border: InputBorder.none,
        prefixIcon: Icon(
          useridTextFieldPrefixIcon,
          color: useridTextFieldPrefixIconColor,
        ),
      ),
    );
  }
}
