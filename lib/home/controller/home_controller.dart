import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tres_x_tres_project/utils/validators.dart';
import 'package:tres_x_tres_project/utils/widgets.dart';
import 'package:tres_x_tres_project/widgets/custom_button.dart';
import 'package:tres_x_tres_project/widgets/custom_textfield.dart';

class HomeController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  late final storage;

  TextEditingController nomeController = TextEditingController();

  RxList<dynamic> jogadores = [].obs;

  Validators validator = Validators();

  @override
  void onInit() async {
    super.onInit();
    storage = await SharedPreferences.getInstance();
    jogadores.value = await storage.getStringList('jogadores') ?? [];
  }

  void addJogadorDialog() {
    UtilsWidgets.defaultDialog(
      'Adicionar jogador',
      SingleChildScrollView(
        child: Column(
          children: [
            CustomTextfield(
              labelText: 'Nome do jogador',
              controller: nomeController,
              validador: validator.userValidator,
              textErro: 'Adicione um nome válido',
            ),
            CustomButton(
              maxWidth: true,
              function: () => addJogador,
              buttonText: 'Adicionar',
            ),
          ],
        ),
      ),
    );
  }

  Future addJogador() async {
    try {
      List<String> list = await storage.getStringList('jogadores') ?? [];
      String nome = GetUtils.removeAllWhitespace(nomeController.text);
      if (validator.hasErroUser ||
          nomeController.text.isEmpty ||
          list.contains(nome)) {
        UtilsWidgets.erroSnackbar('Preencha o nome', 'Adicione um nome válido');
        return;
      }
      list.add(nome);
      jogadores.value = list;
      await storage.setStringList('jogadores', list);
      UtilsWidgets.sucessSnackbar(
          'Jogador criado', '$nome adicionado com sucesso');
      nomeController.text = '';
      Get.offAndToNamed('/home');
    } catch (e) {
      print(e);
      UtilsWidgets.erroSnackbar('Verifique o nome', 'Erro ao adicionar o nome');
    }
  }

  Future removeJogador(index) async {
    try {
      List<String> list = await storage.getStringList('jogadores') ?? [];
      list.remove(list[index]);
      jogadores.value = list;
      await storage.setStringList('jogadores', list);
    } catch (e) {
      print(e);
      UtilsWidgets.erroSnackbar('Erro ao excluir', 'Erro ao excluir o jogador');
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/login');
  }
}
