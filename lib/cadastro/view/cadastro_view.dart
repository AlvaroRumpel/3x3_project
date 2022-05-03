import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/cadastro/controller/cadastro_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_button.dart';
import 'package:tres_x_tres_project/widgets/custom_container.dart';
import 'package:tres_x_tres_project/widgets/custom_scaffold.dart';
import 'package:tres_x_tres_project/widgets/custom_text.dart';
import 'package:tres_x_tres_project/widgets/custom_textfield.dart';

class CadastroView extends StatelessWidget {
  CadastroView({Key? key}) : super(key: key);

  var ct = Get.put(CadastroController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cadastro',
      isSingUp: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Image.asset(
                'assets/FIBA_3x3_Logo_black.png',
                color: const Color.fromARGB(255, 54, 47, 44),
                height: 160,
              ),
            ),
            CustomContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Cadastro',
                    fontSize: 48,
                    vertical: 16,
                    isBold: true,
                  ),
                  CustomTextfield(
                    controller: ct.loginController,
                    labelText: 'Email',
                    validador: ct.validator.emailValidator,
                    textErro: 'Insira o email corretamente',
                  ),
                  CustomTextfield(
                    controller: ct.senhaController,
                    labelText: 'Senha',
                    obscureText: true,
                    validador: ct.validator.senhaValidator,
                    textErro: 'A senha precisa ter mais de 8 caracteres',
                    action: TextInputAction.done,
                  ),
                  CustomTextfield(
                    controller: ct.confirmSenhaController,
                    labelText: 'Confirmar senha',
                    obscureText: true,
                    validador: ct.checkSenhas,
                    textErro: 'A senha não confere',
                    action: TextInputAction.done,
                  ),
                  CustomButton(
                    function: () => ct.singUp,
                    buttonText: 'Login',
                    maxWidth: true,
                    fontSize: 24,
                    height: 56,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
