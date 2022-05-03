import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/utils/validators.dart';
import 'package:tres_x_tres_project/utils/widgets.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  Validators validator = Validators();

  @override
  void onClose() {
    loginController.dispose();
    senhaController.dispose();
    super.onClose();
  }

  Future singIn() async {
    if (validator.hasErroEmail ||
        validator.hasErroSenha ||
        loginController.text.isEmpty ||
        senhaController.text.isEmpty) {
      UtilsWidgets.erroSnackbar('Preencha os campos corretamente',
          'Dados incompletos ou incorretos, verifique');
      return;
    }
    try {
      UtilsWidgets.loadingDialog('Logando...');
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text.trim(),
        password: GetUtils.removeAllWhitespace(senhaController.text.trim()),
      );
      Get.back();
      Get.offAndToNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.back();
      UtilsWidgets.erroSnackbar('Erro no login', e.message);
    }
  }

  singUp() {
    Get.toNamed('/singUp');
  }
}
