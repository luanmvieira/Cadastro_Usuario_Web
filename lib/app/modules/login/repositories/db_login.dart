import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ConexaoFirebaseLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> getUserDataLogin(String userlogin) async {
    UserModel _user = UserModel();
    QuerySnapshot _userQuerycpf = await _db.collection("usuarios").where("cpf", isEqualTo: userlogin).get();
    QuerySnapshot _userQuerypis = await _db.collection("usuarios").where("pis", isEqualTo: userlogin).get();
    QuerySnapshot _userQueryemail = await _db.collection("usuarios").where("email", isEqualTo: userlogin).get();
    if(_userQuerycpf.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQuerycpf.docs.first);
      print("carregou o usermodel - cpf");
    }else
    if(_userQuerypis.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQuerypis.docs.first);
      print("carregou o usermodel - pis");
    }else
    if(_userQueryemail.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQueryemail.docs.first);
      print("carregou o usermodel - email");
    }else{

    }
    return _user;
  }

  Future logarUsuario(UserModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return true;
    } catch (error) {
      print("Logar usuario: erro " + error.toString());
      return false;
    }
  }

  Future logout() async {
    await auth.signOut();
    return true;
  }
}
