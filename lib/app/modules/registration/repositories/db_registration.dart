import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoFirebaseCadastro {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future CadastrarUsuario(UserModel user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      db.collection("usuarios").doc(user.cpf).set(user.toMap());
      print("Usuario Criado");
      return true;
    } catch (error) {
      print("erro ao criar user" + error.toString());
    }
  }

}