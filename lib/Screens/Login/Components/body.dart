import 'package:capstone_project/Components/already_have_an_account_acheck.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/rounded_input_field.dart';
import 'package:capstone_project/Components/rounded_input_password.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/Login/Request/login_model.dart';
import 'package:capstone_project/Screens/Login/Components/background.dart';
import 'package:capstone_project/Screens/Login/Components/forgot_password.dart';
import 'package:capstone_project/State/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<AuthState>(
        builder: (BuildContext context, state, child) {
          return Background(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.07),
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 30, right: 15),
                        child: Text(
                          "Hi, Welcome",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Image.asset("assets/images/waving-hand.png"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sign In to Your Account",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'assets/images/login.png',
                      scale: 5.0,
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Email",
                    icon: Icons.email_sharp,
                    inputType: TextInputType.emailAddress,
                    controller: _conEmail,
                  ),
                  RoundedPasswordField(
                    hintText: 'Password',
                    controller: _conPassword,
                  ),
                  RoundedButton(
                    text: "Sign In",
                    color: kPrimaryColor,
                    press: () async {
                      String email = _conEmail.text;
                      String password = _conPassword.text;
                      final getToast = ScaffoldMessenger.of(context);
                      if (_formKey.currentState!.validate()) {
                        fetchData(context);
                        final navigator = Navigator.of(context);
                        final getRespon = await state.loginUser(
                          LoginModel(
                            email: email,
                            password: password,
                          ),
                        );
                        if (getRespon!.code == '400') {
                          getToast.showSnackBar(
                              toastDialog(getRespon.message, Colors.red));
                        }
                        // dismiss dialog loading
                        navigator.pop();
                      }
                    },
                    width: size.width * 0.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: HomeTextStyle(
                          size: 14,
                          content: 'Forgot Password',
                          color: kPrimaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
