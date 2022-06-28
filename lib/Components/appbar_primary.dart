import 'package:flutter/material.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  final String content;
  const AppBarPrimary({
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
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 32,
      ),
      title: Text(content),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
