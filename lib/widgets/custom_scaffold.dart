import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/login/view/login_view.dart';

class CustomScaffold extends StatelessWidget {
  String title;
  Widget body;
  Widget? bottomNav;
  bool isSingUp;

  CustomScaffold({
    Key? key,
    this.bottomNav,
    this.isSingUp = false,
    required this.title,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomNav,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: body,
        ),
      ),
    );
  }
}
