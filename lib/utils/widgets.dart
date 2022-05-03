import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsWidgets {
  UtilsWidgets.loadingDialog(String title) {
    Get.defaultDialog(
      title: title,
      titlePadding: const EdgeInsets.symmetric(vertical: 32),
      titleStyle: const TextStyle(
        color: Color(0xffefefef),
      ),
      backgroundColor: const Color(0xff27201D),
      radius: 10,
      content: const CircularProgressIndicator(),
    );
  }
  UtilsWidgets.erroSnackbar(String title, String? description) {
    Get.snackbar(
      title,
      description ?? 'Por favor verifique as informações',
      colorText: const Color(0xffefefef),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xffff3333),
    );
  }
}
