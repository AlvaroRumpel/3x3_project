import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  IconData? icon;
  String buttonText;
  bool maxWidth;
  double height;
  double fontSize;
  IconData? iconData;
  CustomButton({
    Key? key,
    required this.function,
    this.icon,
    this.maxWidth = false,
    this.height = 40,
    this.fontSize = 16,
    this.iconData,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: maxWidth ? double.maxFinite : null,
        height: height,
        child: icon != null
            ? ElevatedButton.icon(
                onPressed: function(),
                label: Text(
                  buttonText,
                  style: TextStyle(fontSize: fontSize),
                ),
                icon: Icon(icon),
              )
            : ElevatedButton(
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
