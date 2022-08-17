// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on _RegistrationStoreBase, Store {
  late final _$usuarioAtom =
      Atom(name: '_RegistrationStoreBase.usuario', context: context);

  @override
  UserModel get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UserModel value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$resultUsuarioAtom =
      Atom(name: '_RegistrationStoreBase.resultUsuario', context: context);

  @override
  bool get resultUsuario {
    _$resultUsuarioAtom.reportRead();
    return super.resultUsuario;
  }

  @override
  set resultUsuario(bool value) {
    _$resultUsuarioAtom.reportWrite(value, super.resultUsuario, () {
      super.resultUsuario = value;
    });
  }

  late final _$retornarInfosCepAsyncAction =
      AsyncAction('_RegistrationStoreBase.retornarInfosCep', context: context);

  @override
  Future retornarInfosCep(String cep) {
    return _$retornarInfosCepAsyncAction.run(() => super.retornarInfosCep(cep));
  }

  late final _$CadastrarUserAsyncAction =
      AsyncAction('_RegistrationStoreBase.CadastrarUser', context: context);

  @override
  Future CadastrarUser() {
    return _$CadastrarUserAsyncAction.run(() => super.CadastrarUser());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
resultUsuario: ${resultUsuario}
    ''';
  }
}
