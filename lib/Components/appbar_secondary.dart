import 'package:flutter/material.dart';

class AppbarSecondary extends StatelessWidget implements PreferredSizeWidget {
  final String content;
  const AppbarSecondary({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 32,
      ),
      title: Text(
        content,
        style: const TextStyle(
          fontFamily: 'Poppins',
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
