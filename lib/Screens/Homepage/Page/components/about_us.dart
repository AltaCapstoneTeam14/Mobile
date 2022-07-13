import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(content: 'Tentang Bishapay'),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Bishapay Membangun ekosistem dan platform pembayaran serta layanan keuangan yang sesuai dengan kebutuhan kelas menengah/aspiran di Indonesia.\n\nBishapay adalah pembayaran online sehingga fleksibel untuk pembayaran apa pun.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            RoundedButton(
              text: 'Website',
              press: () {
                _launchInBrowser(
                  Uri.parse('https://bishapay-beta.netlify.app/'),
                );
              },
              color: kPrimaryColor,
              width: size.width * 0.5,
            )
          ],
        ),
      ),
    );
  }
}
