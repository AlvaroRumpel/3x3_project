import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/home/controller/home_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_button.dart';
import 'package:tres_x_tres_project/widgets/custom_card.dart';
import 'package:tres_x_tres_project/widgets/custom_container.dart';
import 'package:tres_x_tres_project/widgets/custom_scaffold.dart';
import 'package:tres_x_tres_project/widgets/custom_text.dart';
import 'package:tres_x_tres_project/widgets/custom_text_button.dart';

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
      body: CustomContainer(
        child: Column(
          children: [
            CustomText(
              text: 'Bem-vindo ${ct.user!.displayName.toString()}',
              fontSize: 24,
              vertical: 16,
            ),
            CustomButton(
              function: () => ct.addJogadorDialog,
              buttonText: 'Cadastrar novo jogador',
            ),
            Obx(
              () => ct.jogadores.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: ct.jogadores.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onLongPress: () => ct.removeJogador(index),
                            child: CustomCard(ct.jogadores[index]),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: null,
                    ),
            ),
            CustomTextButton(
              function: () => ct.logout,
              buttonText: 'Logout',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
