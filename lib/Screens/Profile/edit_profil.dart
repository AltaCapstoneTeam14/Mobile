import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/rounded_input_field.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/Profile/request_profile.dart';
import 'package:capstone_project/State/profile_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  const EditProfilPage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final _formKey = GlobalKey<FormState>();

  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPhone = TextEditingController();

  @override
  void initState() {
    _conName.text = widget.name;
    _conEmail.text = widget.email;
    _conPhone.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    _conName.dispose();
    _conPhone.dispose();
    _conEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(content: "Edit Profile"),
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
                  RoundedButton(
                    text: "Simpan",
                    press: () async {
                      String name = _conName.text;
                      String email = _conEmail.text;
                      String phone = _conPhone.text;

                      final getToast = ScaffoldMessenger.of(context);
                      if (_formKey.currentState!.validate()) {
                        fetchData(context);
                        final navigator = Navigator.of(context);
                        final getRespon = await state.edit(
                          ReqEditProfileModel(
                            name: name,
                            email: email,
                            phone: phone,
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
