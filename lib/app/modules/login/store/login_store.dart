import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cadastro_usuario_web/app/modules/login/repositories/db_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  bool progressLogin = false;


  @observable
  bool carregando  = false;



  @action
  Future RealizarLogin() async {
    var resultLogin;
    progressLogin = true;
    usuarioLogin = await dblogin.getUserDataLogin(loginController.text);
    usuarioLogin.email = usuarioLogin.email;
    usuarioLogin.password = passwordController.text;
    resultLogin = await dblogin.logarUsuario(usuarioLogin);
    if (resultLogin == true){
      Modular.to.navigate("/home");
      Fluttertoast.showToast(msg: 'LOGIN EFETUADO COM SUCESSO', timeInSecForIosWeb:3);
    } else {
      Fluttertoast.showToast(msg: 'REVISE SUAS CREDENCIAIS', timeInSecForIosWeb:3);
    }

    progressLogin = false;
  }
}