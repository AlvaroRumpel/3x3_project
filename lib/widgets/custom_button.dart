import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  IconData? icon;
  String buttonText;
  bool? maxSize;
  double fontSize;

  CustomButton({
    Key? key,
    required this.function,
    this.icon,
    this.maxSize,
    this.fontSize = 16,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: maxSize != null ? double.maxFinite : null,
        child: ElevatedButton(
          onPressed: function(),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
