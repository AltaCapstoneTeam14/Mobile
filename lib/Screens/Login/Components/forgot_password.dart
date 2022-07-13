import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/rounded_input_field.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/Login/Request/login_model.dart';
import 'package:capstone_project/State/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey = GlobalKey<FormState>();

  final _conEmail = TextEditingController();

  @override
  void dispose() {
    _conEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(content: 'Forgot Password'),
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Consumer<AuthState>(
            builder: (BuildContext context, state, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInputField(
                    hintText: "Email",
                    icon: Icons.email_sharp,
                    inputType: TextInputType.emailAddress,
                    controller: _conEmail,
                  ),
                  RoundedButton(
                    text: "Reset",
                    color: kPrimaryColor,
                    width: size.width * 0.8,
                    press: () async {
                      String email = _conEmail.text;
                      final getToast = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);
                      fetchData(context);
                      final getRespon = await state.forgotUser(
                        LoginModel(
                          email: email,
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
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
