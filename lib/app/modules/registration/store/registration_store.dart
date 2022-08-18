import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cadastro_usuario_web/app/modules/registration/repositories/db_registration.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStoreBase with _$RegistrationStore;

abstract class _RegistrationStoreBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  ConexaoFirebaseCadastro dbCadastro = ConexaoFirebaseCadastro();
  // Controlers Cadastro dados pessoais
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController cpfController = TextEditingController();
  @observable
  TextEditingController pisController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();


  //Controlers Cadastro Endereço
  @observable
  TextEditingController cepController = TextEditingController();
  @observable
  TextEditingController logradouroController = TextEditingController();
  @observable
  TextEditingController numeroController = TextEditingController();
  @observable
  TextEditingController complementoController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();
  @observable
  TextEditingController cidadeController = TextEditingController();
  @observable
  TextEditingController ufController = TextEditingController();
  @observable
  TextEditingController paisController = TextEditingController();

  @observable
  UserModel usuario = UserModel();
  @observable
  bool resultUsuario = false;


  //Validadores
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
  bool validateCepField(String cep) {
    if (cep != null && cep.length != 0 && cep.length > 7) return true;

    return false;
  }

  bool validateLogradouroField(String logradouro) {
    if (logradouro != null && logradouro.length != 0 && logradouro.length > 3) return true;

    return false;
  }

  bool validateNumeroField(String numero) {
    if (numero != null && numero.length != 0 && numero.length >= 1) return true;

    return false;
  }
  bool validateUfField(String uf) {
    if (uf != null && uf.length != 0 && uf.length > 1) return true;

    return false;
  }
  //Função de consulta a API VIA CEP
  @action
  retornarInfosCep(String cep) async {
    print("Entrou na func");

    final getCep = await http.get(
      Uri.parse("https://viacep.com.br/ws/$cep/json/"),
    );
    print(getCep.statusCode);
    if (getCep.statusCode == 200) {
      print("cod 200");
      var retornoCep = json.decode(getCep.body);
      logradouroController.text = retornoCep['logradouro'];
      bairroController.text = retornoCep['bairro'];
      cidadeController.text = retornoCep['localidade'];
      ufController.text = retornoCep['uf'];
      paisController.text = "Brasil";
      Fluttertoast.showToast(msg:'CEP ENCONTRADO');
      print(logradouroController.text);
    }else
    if (getCep.statusCode == 400) {
      Fluttertoast.showToast(msg:'CEP INVÁLIDO');
    }
    print("Terminou a func");

  }
  //Função de Cadastrar Usuário
  @action
  CadastrarUser () async{

    dynamic resultCadastro = false;
    usuario.username = nameController.text;
    usuario.cpf = cpfController.text;
    usuario.pis = pisController.text;
    usuario.email = emailController.text;
    usuario.password = passwordController.text;
    usuario.cep = cepController.text;
    usuario.logradouro = logradouroController.text;
    usuario.numero = numeroController.text;
    usuario.bairro = bairroController.text;
    usuario.cidade = cidadeController.text;
    usuario.uf = ufController.text;
    usuario.pais = paisController.text;
    resultCadastro = await dbCadastro.CadastrarUsuario(usuario);
    if (resultCadastro != true) {
      print("----------Error ao criar User");
      resultUsuario = false;
    } else {
      Fluttertoast.showToast(msg:'CADASTRO EFETUADO COM SUCESSO');
      print("novo usuario criado com sucesso:" + usuario.email.toString());
      print("---------Sucesso");
      resultUsuario = true;
    }



  }
}