import 'package:flutter/material.dart';

class InkwellGradienButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function()?  onPressed;

  const InkwellGradienButton(
      {Key? key,
      required this.child,
      required this.gradient,
      this.width = 265,
      this.height = 49,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          gradient: gradient,
           boxShadow: [
             BoxShadow(
               color: Colors.grey[500]!,
               offset: Offset(0.0, 1.5),
               blurRadius: 1.5,
             )
          ],
        ),
        child: Material(
          color:  Colors.transparent,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}