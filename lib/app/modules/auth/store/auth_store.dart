import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {


  @action
  checkCurrentUser() {
    print("Entrou na funcao de checkCurrentUser()");
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      print("Entrou na funcao auth");
      if (user != null) {
        print("Entrou na nula");
        Modular.to.popAndPushNamed("/home");

      } else {
        print("Entrou na funcao login");
        Modular.to.popAndPushNamed("/login");
      }
    });

  }

}