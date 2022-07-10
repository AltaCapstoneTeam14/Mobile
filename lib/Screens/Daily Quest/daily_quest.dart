import 'package:capstone_project/Components/background_primary.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundPrimary(
      appBar: "Bishacoin",
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HomeTextStyle(
                  size: 25,
                  content: "1500",
                  fontWeight: FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    "assets/icons/chinese-coin.png",
                    scale: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: size.height * 0.27,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(2, 3),
                  color: Colors.grey,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HomeTextStyle(
                    size: 16,
                    content: "Check-in 2 Day In A Row",
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.45),
          RoundedButton(
            text: 'Claim',
            press: () {},
            color: kPrimaryColor,
            width: size.width * 0.9,
          )
        ],
      ),
    );
  }
}
