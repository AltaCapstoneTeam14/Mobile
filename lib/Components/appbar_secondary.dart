import 'package:flutter/material.dart';

class AppbarSecondary extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final VoidCallback onTap;
  const AppbarSecondary({
    Key? key,
    required this.name,
    required this.onTap,
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
      leading: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(name),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
