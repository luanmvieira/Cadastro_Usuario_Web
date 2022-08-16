import 'package:brasil_fields/brasil_fields.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStoreBase with _$RegistrationStore;
abstract class _RegistrationStoreBase with Store {
  // Cadastro Pessoal
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final pisController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Cadastro Endereço
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final ufController = TextEditingController();
  final paisController = TextEditingController();

  bool validateNameField(String name) {
    if (name != null && name.length != 0 && name.length > 6) return true;

    return false;
  }
  bool validateCPFField(String cpf) {
    return CPFValidator.isValid(cpf);
  }
  bool validatePISField(String pis) {
    if (pis != null && pis.length != 0 && pis.length > 4) return true;

    return false;
  }
  bool validateEmailField(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePassWordField(String password) {
    if (password != null && password.length != 0 && password.length > 8) return true;

    return false;
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}