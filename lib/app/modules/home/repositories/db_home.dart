import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class ConexaoFirebaseHome{

  FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  UserModel _userm = UserModel();
  String emailCurrent = "";

  bool checkCurrentUser() {
    User? user = auth.currentUser;
    // emailCurrent = auth.currentUser!.email.toString();
    return user != null ? true : false;
  }

  Future <UserModel> getCurrentUser() async{
        QuerySnapshot _userQuery = await _db.collection("usuarios").where("email", isEqualTo: auth.currentUser!.email).get();
        if(_userQuery.docs.isNotEmpty){
          print("não é vazio doc");
          _userm = UserModel.fromMap(_userQuery.docs.first);
          print("carregou model");
        }else{
          print("não carregou model");
        }
    print("Email: ${_userm.email.toString()}");
    return _userm;
  }

  Future EditarUsuario(UserModel user) async {
    try {
      _db.collection("usuarios").doc(user.cpf).set(user.toMap());
      print("Usuario Editado");
      return true;
    } catch (error) {
      print("erro ao Editar user" + error.toString());
    }
  }

  Future DeleteUserBd(String cpf) async {

    try{
      await _db.collection('usuarios').doc(cpf).delete();
      User? user = auth.currentUser!;
      await user.delete();
      return true;
    }catch (error) {
      print("erro ao Deletar user" + error.toString());
      return false;

    }



  }

}