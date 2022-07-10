import 'package:capstone_project/Components/appbar_secondary.dart';
import 'package:flutter/material.dart';

class BackgroundPrimary extends StatelessWidget {
  final String appBar;
  final Widget child;
  const BackgroundPrimary({
    Key? key,
    required this.appBar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppbarSecondary(content: appBar),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg-primary.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: size.height * 0.37,
            //   child: child,
            // ),
            child,
          ],
        ),
      ),
    );
  }
}
