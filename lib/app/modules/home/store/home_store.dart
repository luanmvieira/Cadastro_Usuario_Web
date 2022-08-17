import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cadastro_usuario_web/app/modules/home/repositories/db_home.dart';
import 'package:cadastro_usuario_web/app/modules/login/repositories/db_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;
ConexaoFirebaseLogin _dbloginHome = ConexaoFirebaseLogin();


abstract class HomeStoreBase with Store {
  ConexaoFirebaseHome homeRepositories = ConexaoFirebaseHome();

  @observable
  String nameCurrentUser = '';

  @observable
  bool logOutstate = false;

  @observable
  UserModel currentUserModel = UserModel();

  @observable
  bool getValidator = true;

  @action
  Future<void> getCurrentUser() async {
    getValidator = false;
    currentUserModel = await homeRepositories.getCurrentUser();
    nameCurrentUser = currentUserModel.username;
    getValidator = true;
  }

  @action
  Future logOut() async {
    getValidator = false;
    logOutstate = await _dbloginHome.logout();
    if(logOutstate == true){
      Modular.to.navigate("/");
      Fluttertoast.showToast(msg: 'LOGOUT EFETUADO COM SUCESSO');
      getValidator = true;
    }else{
      Fluttertoast.showToast(msg: 'LOGOUT NÃO EFETUADO');
      getValidator = true;
    }
  }

}