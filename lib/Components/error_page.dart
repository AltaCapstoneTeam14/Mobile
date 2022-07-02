import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/State/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/error.png",
            height: 250,
          ),
          RoundedButton(
            text: "Logout",
            press: () {
              Provider.of<AuthState>(context, listen: false).logout();
            },
            color: Colors.red,
            width: size.width * 0.6,
          )
        ],
      ),
    );
  }
}
