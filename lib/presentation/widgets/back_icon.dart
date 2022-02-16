import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  final Function()? onPressed;

  const ArrowBack({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed,
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xFFB1ACAC),
          size: 25,
        ),
      ),
      
    );
  }
}