import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/utils/validators.dart';
import 'package:tres_x_tres_project/utils/widgets.dart';

class CadastroController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmSenhaController = TextEditingController();

  Validators validator = Validators();

  bool checkSenha = false;

  Future singUp() async {
    if (validator.hasErroEmail ||
        validator.hasErroSenha ||
        !checkSenha ||
        loginController.text.isEmpty ||
        senhaController.text.isEmpty ||
        confirmSenhaController.text.isEmpty) {
      UtilsWidgets.erroSnackbar('Preencha os campos corretamente',
          'Dados incompletos ou incorretos, verifique');
      return;
    }
    try {
      UtilsWidgets.loadingDialog('Criando conta...');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginController.text.trim(),
          password: senhaController.text.trim());
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.back();
      UtilsWidgets.erroSnackbar('Erro no cadastro', e.message);
    }
  }

  bool checkSenhas(value) {
    if (senhaController.text == value) {
      checkSenha = true;
      return true;
    }
    checkSenha = false;
    return false;
  }
}
