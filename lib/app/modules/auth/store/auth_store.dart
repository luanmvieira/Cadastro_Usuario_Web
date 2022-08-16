import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part '../auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {

  FirebaseAuth auth = FirebaseAuth.instance;

  @action
  Future VerificarUserLogado()  async {
    User? user = auth.currentUser;
    if (user != null) {
      Modular.to.navigate('/home');
    } else{
      Modular.to.navigate('/login');
    }
  }

}