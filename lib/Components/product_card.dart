import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String amount;
  final double scale;
  final String url;
  final VoidCallback onTap;
  final bool selected;
  const ProductCard({
    Key? key,
    required this.amount,
    this.scale = 1,
    required this.url,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: kPrimaryColor,
            width: 4,
            style: selected ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: scale,
              image: AssetImage(url),
              alignment: Alignment.topCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: HomeTextStyle(
                size: 14,
                content: "Rp. $amount",
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
