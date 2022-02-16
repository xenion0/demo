import 'package:demo/utils/validator.dart';
import 'package:flutter/material.dart';

Widget passwordTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  bool isPassword = true,
  required FormFieldValidator validate,
  required String label,
  required IconData suffix,
  required VoidCallback suffixPressed, 
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        cursorColor: const Color(0xff9E9E9E),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: true,
        autocorrect: false,
        //  onChanged: onChange,
        //    onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
            ),
          ),
          label: Text(label),
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
