import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/login/controller/login_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_button.dart';
import 'package:tres_x_tres_project/widgets/custom_container.dart';
import 'package:tres_x_tres_project/widgets/custom_text.dart';
import 'package:tres_x_tres_project/widgets/custom_text_button.dart';
import 'package:tres_x_tres_project/widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  var ct = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
        child: SingleChildScrollView(
          child: Form(
            key: ct.formKey,
            child: Column(
              children: [
                CustomText(
                  text: 'Login',
                  fontSize: 40,
                  vertical: 16,
                ),
                CustomTextfield(
                  controller: ct.loginController,
                  labelText: 'Email',
                  validador: ct.emailValidator,
                  textErro: 'Insira o email corretamente',
                ),
                CustomTextfield(
                  controller: ct.senhaController,
                  labelText: 'Senha',
                  obscureText: true,
                  validador: ct.passwordValidator,
                  textErro: 'A senha precisa ter mais de 8 caracteres',
                  action: TextInputAction.done,
                ),
                CustomButton(
                  function: () => ct.singIn,
                  buttonText: 'Login',
                  maxSize: true,
                  fontSize: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Não possui conta,'),
                    CustomTextButton(
                      function: () {},
                      buttonText: 'cadastre-se aqui!',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
