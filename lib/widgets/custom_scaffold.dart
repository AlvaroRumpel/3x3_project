import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tres_x_tres_project/login/view/login_view.dart';

class CustomScaffold extends StatelessWidget {
  String title;
  Widget body;

  CustomScaffold({
    Key? key,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return body;
              }
              return LoginView();
            },
          ),
        ),
      ),
    );
  }
}
