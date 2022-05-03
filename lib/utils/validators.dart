import 'package:email_validator/email_validator.dart';

class Validators {
  late bool hasErroEmail, hasErroSenha;
  Validators({
    this.hasErroEmail = false,
    this.hasErroSenha = false,
  });

  bool emailValidator(value) {
    if (!EmailValidator.validate(value)) {
      hasErroEmail = true;
      return false;
    }
    hasErroEmail = false;
    return true;
  }

  bool senhaValidator(value) {
    if (value.length < 8 || value.length > 60) {
      hasErroSenha = true;
      return false;
    }
    hasErroSenha = false;
    return true;
  }
}
