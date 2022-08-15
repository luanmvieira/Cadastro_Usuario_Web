import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;


abstract class _LoginStoreBase with Store {

  @observable
  bool carregando  = false;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();


  @observable
  String email = "";

  @action
  void setEmail(String text) => email = text;

  @observable
  String senha = "";

  @action
  void setSenha(String text) => senha = text;

  @observable
  String recuperarSenha = "";

}