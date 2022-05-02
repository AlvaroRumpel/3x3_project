import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  double vertical;
  double horizontal;
  Color color;
  String text;
  double fontSize;

  CustomText({
    Key? key,
    this.vertical = 0,
    this.horizontal = 0,
    this.color = const Color(0xffefefef),
    this.fontSize = 16,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
