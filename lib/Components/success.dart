import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuksesPage extends StatelessWidget {
  final String status;
  const SuksesPage({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/icons/success.png",
              scale: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HomeTextStyle(
                size: 20,
                content: status.toUpperCase(),
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const HomeTextStyle(
              size: 16,
              content: "Silahkan Periksa Pulsa Kamu",
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            RoundedButton(
              text: "Kembali ke Beranda",
              color: kPrimaryColor,
              width: size.width * 0.6,
              press: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Provider.of<HomeState>(context, listen: false).getUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
