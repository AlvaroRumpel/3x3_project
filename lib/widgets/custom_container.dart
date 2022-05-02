import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget child;

  CustomContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 54, 47, 44),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
