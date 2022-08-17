import 'package:cadastro_usuario_web/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class ConexaoFirebaseHome{

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  UserModel _userm = UserModel();

  Future <UserModel> getCurrentUser() async{
        QuerySnapshot _userQuery = await _db.collection("usuarios").where("email", isEqualTo: auth.currentUser?.email).get();
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

}