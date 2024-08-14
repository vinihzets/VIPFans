import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';

class CustomValidator {
  itensPerPageValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      int? filterValue = int.tryParse(value);

      if (filterValue! > 0 && filterValue < 101) {
        return null;
      } else {
        return 'Insira um numero, entre 1 e 100!';
      }
    } else {
      return 'Insira um numero, entre 1 e 100!';
    }
  }

  static validateClientSelected(dynamic value) {
    if (value == null) {
      return 'Defina um cliente';
    }

    return null;
  }

  static bool validatePassword(String password) {
    // Regex para validar senha
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

    return passwordRegex.hasMatch(password);
  }

  passwordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return '   Insira uma senha de no minimo 6 caracteres';
    } else if (value != null && value.length >= 6) {
      return null;
    } else {
      return '   Insira uma senha de no minimo 6 caracteres';
    }
  }

  templateMessageValidator(String? value) {
    if (value == null || value.length < 5) {
      return "Digite a mensagem que será enviada ao chip via SMS, com ao menos 5 caracteres.";
    }
    return null;
  }

  messageValidator(String? value) {
    {
      if (value == null || value.length < 5) {
        return "Adicione um nome ao template com ao menos 5 caracteres.";
      }
      return null;
    }
  }

  numberValidator(String? value) {
    if (value == null || value.length < 11 || value.length > 17) {
      return "Digite o número  com DDD do chip que receberá o SMS.";
    }
    return null;
  }

  emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '  Insira um endereço de email.';
    }
    if (!EmailValidator.validate(value)) {
      return '  Endereço de email inválido.';
    }

    return null;
  }

  nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um Nome.';
    }
    if (value.length < 5) {
      return 'O minimo permitido para este dado deve ser de 5 caracteres.';
    }

    return null;
  }

  cpfValidator(String? value) {
    if (value == null) {
      return "Digite o CPF";
    }

    return CPFValidator.isValid(value) ? null : "CPF Inválido.";
  }

  razaoSocialValidator(String? value) {
    if (value == null || value.length < 3) {
      return "Insira a Razão Social.";
    }
    return null;
  }

  nomeFantasiaValidator(String? value) {
    if (value == null || value.length < 3) {
      return "Insira o Nome Fantasia.";
    }
    return null;
  }

  gestorNameValidator(String? value) {
    if (value == null || value.length < 3) {
      return "Insira o Nome do Gestor.";
    }
    return null;
  }

  nameClienteValidator(String? value) {
    if (value == null || value.length < 3) {
      return "Insira o Nome do Cliente.";
    }
    return null;
  }

  bairroValidator(String? value) {
    if (value == null || value.toString().isEmpty) {
      return "Insira o Bairro em Endereço.";
    }
    if (value.length < 3) {
      return "Nome do Bairro muito curto.";
    }
    return null;
  }

  cidadeValidator(String? value) {
    if (value == null || value.toString().isEmpty) {
      return "Insira a Cidade em Endereço.";
    }
    if (value.length < 3) {
      return "Nome da Cidade muito curto.";
    }
    return null;
  }

  cepValidator(String? value) {
    if (value == null) return "Digite o CEP.";
    if (value.length < 9) return "CEP Incompleto.";
    return null;
  }

  phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira o número de Telefone.';
    }
    if (value.length < 14) {
      return "Telefone Incompleto.";
    }
    return null;
  }

  whatsappValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira o número de Whatsapp.";
    }
    if (value.length < 14) {
      return "Número de Whatsapp Incompleto.";
    }
    return null;
  }

  ruaValidator(String? value) {
    if (value == null || value.toString().isEmpty) {
      return "Insira a Rua em Endereço.";
    }
    if (value.length < 3) {
      return "Nome da Rua muito curto.";
    }
    return null;
  }
}
