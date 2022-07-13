import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Screens/Homepage/Page/components/about_us.dart';
import 'package:capstone_project/Screens/Profile/edit_password.dart';
import 'package:capstone_project/Screens/Profile/edit_profil.dart';
import 'package:capstone_project/State/auth_provider.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<ProfileState>(context, listen: false);
      getState.getUser();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProfileState>(
      builder: (BuildContext context, state, child) {
        if (state.stateType == StateType.loading) {
          return const LoadingAnimation();
        }
        if (state.stateType == StateType.error) {
          return const ErrorPage();
        }
        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilPage(
                        name: state.data.name!,
                        email: state.data.email!,
                        phone: state.data.phone!,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: HomeTextStyle(
                    size: 23,
                    content: state.data.name!,
                    color: kPrimaryDarkColor,
                  ),
                  subtitle: HomeTextStyle(
                    size: 13,
                    content: state.data.email!,
                    color: kPrimaryDarkColor,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: kPrimaryDarkColor,
                  ),
                ),
              ),
            ),
            MenuProfile(
              name: 'Ubah Password',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditPassPage(),
                  ),
                );
              },
            ),
            MenuProfile(
              name: 'Bantuan',
              press: () {},
            ),
            MenuProfile(
              name: 'Tentang Aplikasi',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            MenuProfile(
              name: 'Keluar',
              color: Colors.red,
              press: () {
                bottomSheetPrimary(
                  context,
                  size,
                  "Konfirmasi Keluar",
                  RoundedButton(
                    text: "Logout",
                    press: () {
                      Navigator.pop(context);
                      Provider.of<AuthState>(context, listen: false).logout();
                    },
                    color: Colors.red,
                    width: size.width * 0.9,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class MenuProfile extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback press;
  const MenuProfile({
    Key? key,
    required this.name,
    required this.press,
    this.color = kPrimaryDarkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: press,
        child: ListTile(
          title: HomeTextStyle(
            size: 23,
            content: name,
            color: color,
            fontWeight: FontWeight.w500,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: color,
          ),
        ),
      ),
    );
  }
}
