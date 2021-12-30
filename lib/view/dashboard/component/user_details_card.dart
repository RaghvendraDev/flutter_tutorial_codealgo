import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height * 0.4 - 27,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "Hi, $name",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 60,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 110,
                    vertical: 10,
                  ),
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.purple.withOpacity(0.90),
                        ),
                      ]),
                  child: Text(
                    "User Profile",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          height: size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 90,
                  color: Colors.purple.withOpacity(0.90),
                ),
              ]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/svg/ellipse_top_pink.svg"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("assets/svg/ellipse_bottom_pink.svg"),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 10,
                child: Text(
                  mobile,
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 10,
                child: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  gender,
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.orange,
                          spreadRadius: 20,
                        ),
                      ]),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: MemoryImage(base64Decode(profilePic)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
