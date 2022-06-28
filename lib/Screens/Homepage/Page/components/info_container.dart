import 'package:capstone_project/Components/text_style.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String phone;
  final String balance;
  final Size size;
  const InfoContainer({
    Key? key,
    required this.size,
    required this.phone,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.95,
      height: 200,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg-home-nominal.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: HomeTextStyle(
                content: phone,
                size: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const HomeTextStyle(
                    content: "Your Balance",
                    size: 18,
                  ),
                  HomeTextStyle(
                    content: balance,
                    size: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Image.asset(
                  'assets/icons/chinese-coin.png',
                  scale: 25,
                ),
              ),
              const HomeTextStyle(
                content: "500",
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
