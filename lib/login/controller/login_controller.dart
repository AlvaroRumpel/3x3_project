import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future singIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      Get.defaultDialog(
        title: 'Carregando...',
        titlePadding: const EdgeInsets.symmetric(vertical: 32),
        titleStyle: const TextStyle(
          color: Color(0xffefefef),
        ),
        backgroundColor: const Color(0xff27201D),
        radius: 10,
        content: const CircularProgressIndicator(),
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text.trim(),
        password: senhaController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.back();
      Get.snackbar(
        'Erro ao login',
        'Verifique as informações',
        colorText: const Color(0xffefefef),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xffff3333),
      );
    }
  }

  bool emailValidator(value) {
    return EmailValidator.validate(value);
  }

  bool passwordValidator(value) {
    if (value.length >= 8 && value.length < 60) {
      return true;
    }
    return false;
  }
}
