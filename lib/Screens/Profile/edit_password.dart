import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/rounded_input_password.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/Profile/request_password.dart';
import 'package:capstone_project/State/profile_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPassPage extends StatefulWidget {
  const EditPassPage({Key? key}) : super(key: key);

  @override
  State<EditPassPage> createState() => _EditPassPageState();
}

class _EditPassPageState extends State<EditPassPage> {
  final _formKey = GlobalKey<FormState>();

  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();

  @override
  void dispose() {
    _conCPassword.dispose();
    _conPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(content: "Change Password"),
      body: Consumer<ProfileState>(
        builder: (BuildContext context, state, child) {
          return SizedBox(
            width: double.infinity,
            height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedPasswordField(
                    hintText: 'Password',
                    controller: _conPassword,
                  ),
                  RoundedPasswordField(
                    hintText: 'Confirm Password',
                    controller: _conCPassword,
                  ),
                  RoundedButton(
                    text: "Simpan",
                    press: () async {
                      String passwd = _conPassword.text;
                      String cpasswd = _conCPassword.text;

                      final getToast = ScaffoldMessenger.of(context);
                      if (_formKey.currentState!.validate()) {
                        if (passwd != cpasswd) {
                          getToast.showSnackBar(toastDialog(
                              'Password is not same', Colors.redAccent));
                        } else {
                          fetchData(context);
                          final navigator = Navigator.of(context);
                          final getRespon = await state.changePass(
                            ReqEditPassModel(
                              password: passwd,
                            ),
                          );
                          if (getRespon.code == '201') {
                            getToast.showSnackBar(
                                toastDialog(getRespon.message!, Colors.green));
                          } else {
                            getToast.showSnackBar(
                                toastDialog(getRespon.message!, Colors.red));
                          }
                          // dismiss dialog loading
                          navigator.pop();
                          // Go to page login
                          navigator.pop();
                          state.getUser();
                        }
                      }
                    },
                    color: kPrimaryColor,
                    width: size.width * 0.8,
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
