import 'package:capstone_project/Components/text_style.dart';
import 'package:flutter/material.dart';

class ProductCardV2 extends StatelessWidget {
  final String amount;
  final String name;
  final VoidCallback onTap;
  final bool selected;
  const ProductCardV2({
    Key? key,
    required this.amount,
    required this.name,
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
            color: Colors.green,
            width: 4,
            style: selected ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/bg-pulsa.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: HomeTextStyle(
                  size: 18,
                  content: name,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 10),
                child: HomeTextStyle(
                  size: 14,
                  content: amount,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
