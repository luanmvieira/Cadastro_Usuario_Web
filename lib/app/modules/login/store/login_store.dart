import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cadastro_usuario_web/app/modules/login/repositories/db_login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;


abstract class _LoginStoreBase with Store {
  ConexaoFirebaseLogin dblogin = ConexaoFirebaseLogin();
  @observable
  UserModel usuarioLogin = UserModel();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  UserModel usuario = UserModel();
  @observable
  bool resultLogin = false;
  @observable
  bool progressLogin = false;


  @observable
  bool carregando  = false;



  @action
  Future RealizarLogin() async {
    progressLogin = true;
    usuarioLogin = await dblogin.getUserData(loginController.text);
    usuario.email = usuarioLogin.email;
    usuario.password = passwordController.text;
    resultLogin = await dblogin.logarUsuario(usuario);
    if (resultLogin != true) {
      Fluttertoast.showToast(msg: 'ERRO NO LOGIN, REVISE SUAS CREDENCIAIS');
    } else {
      Fluttertoast.showToast(msg: 'LOGIN EFETUADO COM SUCESSO');
    }
    progressLogin = false;
  }
}