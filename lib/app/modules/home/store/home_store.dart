import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cadastro_usuario_web/app/modules/home/repositories/db_home.dart';
import 'package:cadastro_usuario_web/app/modules/login/repositories/db_login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;


part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;
ConexaoFirebaseLogin _dbloginHome = ConexaoFirebaseLogin();
ConexaoFirebaseHome _dbHome = ConexaoFirebaseHome ();

abstract class HomeStoreBase with Store {
  ConexaoFirebaseHome homeRepositories = ConexaoFirebaseHome();
  // Controlers Update dados pessoais
  final updateNameController = TextEditingController();
  final updateCpfController = TextEditingController();
  final updatePisController = TextEditingController();
  final updateEmailController = TextEditingController();

  //Controlers Update Endereço
  final updateCepController = TextEditingController();
  final updateLogradouroController = TextEditingController();
  final updateNumeroController = TextEditingController();
  final updateBairroController = TextEditingController();
  final updateCidadeController = TextEditingController();
  final updateUfController = TextEditingController();
  final updatePaisController = TextEditingController();

  @observable
  UserModel userModelHome = UserModel();

  @observable
  bool resultEditUsuario = false;

  @observable
  String nameCurrentUser = '';

  @observable
  bool logOutstate = false;
  @observable
  bool deleteState = false;

  @observable
  UserModel currentUserModel = UserModel();


  @observable
  bool getValidator = true;
  @observable
  bool deleteValidator = true;

  final acesso = ConexaoFirebaseHome();

  @observable
  bool resultado = false;



  @action
  void checkUserLoggedIn() {
    resultado = acesso.checkCurrentUser();
    if (resultado == false) Modular.to.navigate('/');
  }



  @action
  void setUser(UserModel userSet){
    updateNameController.text = userSet.username;
    updateCpfController.text = userSet.cpf;
    updatePisController.text = userSet.pis;
    updateEmailController.text = userSet.email;

    updateCepController.text = userSet.cep;
    updateLogradouroController.text = userSet.logradouro;
    updateNumeroController.text = userSet.numero;
    updateBairroController.text = userSet.bairro;
    updateCidadeController.text = userSet.cidade;
    updateUfController.text = userSet.uf;
    updatePaisController.text = userSet.pais;
  }
  @action
  void resetUser(){
    updateNameController.text = "";
    updateCpfController.text = "";
    updatePisController.text = "";
    updateEmailController.text = "";

    updateCepController.text = "";
    updateLogradouroController.text = "";
    updateNumeroController.text = "";
    updateBairroController.text = "";
    updateCidadeController.text = "";
    updateUfController.text = "";
    updatePaisController.text = "";
  }

  @action
  Future<void> getCurrentUser() async {
    getValidator = false;
    currentUserModel = await homeRepositories.getCurrentUser();
    nameCurrentUser = currentUserModel.username;
    setUser(currentUserModel);
    getValidator = true;
  }

  @action
  Future logOut() async {
    getValidator = false;
    logOutstate = await _dbloginHome.logout();
    if(logOutstate == true){
      Modular.to.navigate("/");
      Fluttertoast.showToast(msg: 'LOGOUT EFETUADO COM SUCESSO', timeInSecForIosWeb:3);
      getValidator = true;
    }else{
      Fluttertoast.showToast(msg: 'LOGOUT NÃO EFETUADO', timeInSecForIosWeb:3);
      getValidator = true;
    }
  }

  @action
  Future deleteUser() async {
    resultEditUsuario = false;
    await getCurrentUser();
    deleteState = await _dbHome.DeleteUserBd(currentUserModel.cpf);
    if(deleteState == true){
      Modular.to.navigate("/");
      Fluttertoast.showToast(msg: 'DELETE EFETUADO COM SUCESSO', timeInSecForIosWeb:3);
      resultEditUsuario = true;
    }else{
      Fluttertoast.showToast(msg: 'DELETE NÃO EFETUADO', timeInSecForIosWeb:3);
      resultEditUsuario = true;
    }
  }

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
      updateLogradouroController.text = retornoCep['logradouro'];
      updateBairroController.text = retornoCep['bairro'];
      updateCidadeController.text = retornoCep['localidade'];
      updateUfController.text = retornoCep['uf'];
      updatePaisController.text = "Brasil";
      Fluttertoast.showToast(msg:'CEP ENCONTRADO');
    }else
    if (getCep.statusCode == 400) {
      Fluttertoast.showToast(msg:'CEP INVÁLIDO');
    }
    print("Terminou a func");

    return getCep.statusCode;

  }

  //Função de Cadastrar Usuário
  @action
  EditarUser () async{
    dynamic resultCadastro = false;
    userModelHome.username = updateNameController.text;
    userModelHome.cpf = updateCpfController.text;
    userModelHome.pis = updatePisController.text;
    userModelHome.email = updateEmailController.text;
    userModelHome.cep = updateCepController.text;
    userModelHome.logradouro = updateLogradouroController.text;
    userModelHome.numero = updateNumeroController.text;
    userModelHome.bairro = updateBairroController.text;
    userModelHome.cidade = updateCidadeController.text;
    userModelHome.uf = updateUfController.text;
    userModelHome.pais = updatePaisController.text;
    resultCadastro = await _dbHome.EditarUsuario(userModelHome);
    if (resultCadastro != true) {
      print("----------Error ao editar User");
      resultEditUsuario = false;
    } else {
      Fluttertoast.showToast(msg:'EDIÇÃO EFETUADA COM SUCESSO', timeInSecForIosWeb:5);
      print("novo usuario criado com sucesso:" + userModelHome.email.toString());
      print("---------Sucesso");
      resultEditUsuario = true;
    }



  }
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

}