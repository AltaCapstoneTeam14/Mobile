import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PendingPage extends StatelessWidget {
  final String? va;
  final String status;
  const PendingPage({
    Key? key,
    this.va,
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
              "assets/icons/pending.png",
              scale: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HomeTextStyle(
                size: 16,
                content: va!,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            HomeTextStyle(
              size: 16,
              content: "Status : $status",
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            RoundedButton(
              text: "Kembali ke Beranda",
              color: kPrimaryColor,
              width: size.width * 0.6,
              press: () {
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => const HomePage()),
                //     ModalRoute.withName('/'));
                // Navigator.restorablePopAndPushNamed(context, '/homepage');
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
