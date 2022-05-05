import 'package:flutter/material.dart';
import 'package:tres_x_tres_project/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  String title;

  CustomCard(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0x5fee6730),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomText(text: title),
      ),
    );
  }
}
