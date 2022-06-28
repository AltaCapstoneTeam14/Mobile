import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/text_field_container.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isEnable;
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isEnable = true,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        enabled: isEnable,
        keyboardType: inputType,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hintText is Required';
          }
          if (hintText == "Email" && !validateEmail(value)) {
            return 'The email address is invalid';
          }
          if (hintText == "Phone Number" &&
              (value.length < 10 || value.length > 18)) {
            return 'The length must be between 10 and 18 characters';
          }
          return null;
        },
      ),
    );
  }
}
