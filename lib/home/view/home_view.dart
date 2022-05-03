import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/home/controller/home_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_button.dart';
import 'package:tres_x_tres_project/widgets/custom_container.dart';
import 'package:tres_x_tres_project/widgets/custom_scaffold.dart';
import 'package:tres_x_tres_project/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  var ct = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Inicio',
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Get.toNamed('novo-jogo'),
        child: Icon(Icons.sports_basketball),
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              CustomText(
                text: ct.user!.displayName.toString(),
              ),
              CustomButton(
                function: () => ct.logout,
                buttonText: 'Logout',
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
