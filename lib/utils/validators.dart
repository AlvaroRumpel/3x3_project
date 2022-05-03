import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class Validators {
  late bool hasErroEmail, hasErroSenha, hasErroUser;
  Validators({
    this.hasErroEmail = false,
    this.hasErroSenha = false,
    this.hasErroUser = false,
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
    value = GetUtils.removeAllWhitespace(value);
    if (!GetUtils.isLengthBetween(value, 8, 60)) {
      hasErroSenha = true;
      return false;
    }
    hasErroSenha = false;
    return true;
  }

  bool userValidator(value) {
    if (!GetUtils.isUsername(value)) {
      hasErroUser = true;
      return false;
    }
    hasErroUser = false;
    return true;
  }
}
