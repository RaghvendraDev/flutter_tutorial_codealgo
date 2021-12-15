import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:welcome_loginsignup_dashboard/model/user_model_list.dart';

class UserDetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final String gender;
  final String profilePic;
  const UserDetailsCard({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.profilePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: MemoryImage(
            base64Decode(profilePic),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          email,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
