import 'package:flutter/material.dart';
import 'package:tres_x_tres_project/widgets/custom_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Inicio',
      body: SingleChildScrollView(
        child: Row(),
      ),
    );
  }
}
