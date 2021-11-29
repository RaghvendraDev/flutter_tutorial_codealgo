import 'package:flutter/material.dart';

class SignUpProfilePicture extends StatelessWidget {
  const SignUpProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profilepic.png"),
          radius: 80,
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            child: Icon(Icons.camera),
            onTap: () {
              print("Camera clicked");
            },
          ),
        ),
      ],
    );
  }
}
