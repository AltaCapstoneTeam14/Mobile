import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Screens/Homepage/Page/history.dart';
import 'package:capstone_project/Screens/Homepage/Page/home.dart';
import 'package:capstone_project/Screens/Homepage/Page/profile.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final page = [
      const History(),
      Home(size: size),
      const Profile(),
    ];
    return Scaffold(
      appBar: const AppBarHome(),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: page[index],
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const [
          "History",
          "Home",
          "Profile",
        ],
        icons: const [
          Icons.history,
          Icons.home,
          Icons.people_alt,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: kPrimaryDarkColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: kPrimaryColor,
        onTabItemSelected: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
        scale: 1.5,
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Icons.notifications_active,
            color: Colors.yellow.shade600,
            size: 40,
          ),
        ),
      ],
    );
  }
}
