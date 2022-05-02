import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  String? textErro;
  bool? obscureText;
  Function? validador;
  TextInputAction? action;

  CustomTextfield({
    Key? key,
    required this.labelText,
    required this.controller,
    this.textErro,
    this.obscureText,
    this.validador,
    this.action = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: action,
        obscureText: obscureText ?? false,
        style: const TextStyle(
          color: Color(0xffefefef),
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x5fee6730),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffff1111),
              width: 2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffff1111),
              width: 2,
            ),
          ),
          label: Text(labelText),
          labelStyle: const TextStyle(
            color: Color(0x5fee6730),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            value!.isNotEmpty && validador!(value) ? null : textErro,
      ),
    );
  }
}
