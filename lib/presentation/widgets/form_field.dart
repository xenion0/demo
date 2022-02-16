import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  bool obscuretext;
  final String labelTx;
  final FormFieldValidator validat;
  final TextInputType textInputType;
  final VoidCallback onTap;

  CustomFormField({
    Key? key,
    required this.controller,
     this.obscuretext=false,
    required this.labelTx,
    required this.validat,
    required this.textInputType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        cursorColor: const Color(0xff9E9E9E),
        controller: controller,
        keyboardType: textInputType,
        validator: validat,
        enabled: true,
        autocorrect: false,
        obscureText: obscuretext,
        onTap: onTap,
        decoration: InputDecoration(
          label: Text(labelTx),
          labelStyle: const TextStyle(color: Color(0xff9E9E9E), fontSize: 15),
          fillColor: Colors.white,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9E9E9E)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9E9E9E)),
          ),
        ),
      ),
    );
  }
}