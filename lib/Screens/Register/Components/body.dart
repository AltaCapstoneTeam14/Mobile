import 'package:capstone_project/Components/already_have_an_account_acheck.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/rounded_input_field.dart';
import 'package:capstone_project/Components/rounded_input_password.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/Register/Request/register_model.dart';
import 'package:capstone_project/Screens/Register/Components/background.dart';
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

  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  final _conPhone = TextEditingController();

  @override
  void dispose() {
    _conName.dispose();
    _conPhone.dispose();
    _conCPassword.dispose();
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
                  SizedBox(height: size.height * 0.08),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Full Name",
                    icon: Icons.person,
                    inputType: TextInputType.name,
                    controller: _conName,
                  ),
                  RoundedInputField(
                    hintText: "Email",
                    icon: Icons.email_sharp,
                    inputType: TextInputType.emailAddress,
                    controller: _conEmail,
                  ),
                  RoundedInputField(
                    hintText: "Phone Number",
                    icon: Icons.call,
                    inputType: TextInputType.number,
                    controller: _conPhone,
                  ),
                  RoundedPasswordField(
                    hintText: 'Password',
                    controller: _conPassword,
                  ),
                  RoundedPasswordField(
                    hintText: 'Confirm Password',
                    controller: _conCPassword,
                  ),
                  RoundedButton(
                    text: "Sign Up",
                    color: kPrimaryColor,
                    press: () async {
                      String name = _conName.text;
                      String email = _conEmail.text;
                      String passwd = _conPassword.text;
                      String cpasswd = _conCPassword.text;
                      String phone = _conPhone.text;

                      final getToast = ScaffoldMessenger.of(context);
                      if (_formKey.currentState!.validate()) {
                        if (passwd != cpasswd) {
                          getToast.showSnackBar(toastDialog(
                              'Password is not same', Colors.redAccent));
                        } else {
                          fetchData(context);
                          final navigator = Navigator.of(context);
                          final getRespon = await state.addUser(
                            RegisterModel(
                              name: name,
                              email: email,
                              password: passwd,
                              phone: phone,
                            ),
                          );
                          if (getRespon!.code == '201') {
                            getToast.showSnackBar(
                                toastDialog(getRespon.message, Colors.green));
                          } else {
                            getToast.showSnackBar(
                                toastDialog(getRespon.message, Colors.red));
                          }
                          // dismiss dialog loading
                          navigator.pop();
                          // Go to page login
                          navigator.pop();
                        }
                      }
                    },
                    width: size.width * 0.8,
                  ),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.pop(context);
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
