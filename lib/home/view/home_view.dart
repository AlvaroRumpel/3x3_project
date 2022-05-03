import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/home/controller/home_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_bottom_nav.dart';
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
      bottomNav: CustomBottomNav(index: 0),
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              CustomText(
                text: ct.user!.email.toString(),
              ),
              CustomButton(
                  function: () => ct.logout,
                  buttonText: 'Logout',
                  icon: Icons.logout)
            ],
          ),
        ),
      ),
    );
  }
}
