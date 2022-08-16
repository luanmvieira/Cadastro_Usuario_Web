
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  String cpf;
  String pis;
  String email;
  String password;
  String cep;
  String logradouro;
  String numero;
  String bairro;
  String cidade;
  String uf;
  String pais;


  UserModel({
    this.username = '',
    this.cpf = '',
    this.pis = '',
    this.email = '',
    this.password = '',
    this.cep = '',
    this.logradouro = '',
    this.numero = '',
    this.bairro = '',
    this.cidade = '',
    this.uf = '',
    this.pais = '',

}
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome"                    : this.username,
      "cpf"                     : this.cpf,
      "pis"                     : this.pis,
      "email"                   : this.email,
      "cep"                     : this.cep,
      "logradouro"              : this.logradouro,
      "numero"                  : this.numero,
      "bairro"                  : this.bairro,
      "cidade"                  : this.cidade,
      "uf"                      : this.uf,
      "pais"                    : this.pais,

    };
    return map;

  }

  factory UserModel.fromMap(DocumentSnapshot doc) {
    return UserModel(
      username: doc['nome'],
      cpf: doc['cpf'],
      pis: doc['pis'],
      email: doc['email'],
      cep: doc['cep'],
      logradouro: doc['logradouro'],
      numero: doc['numero'],
      bairro: doc['bairro'],
      cidade: doc['cidade'],
      uf: doc['uf'],
      pais: doc['pais'],
    );
  }
}
