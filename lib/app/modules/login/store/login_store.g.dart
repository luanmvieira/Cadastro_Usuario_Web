// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$usuarioLoginAtom =
      Atom(name: '_LoginStoreBase.usuarioLogin', context: context);

  @override
  UserModel get usuarioLogin {
    _$usuarioLoginAtom.reportRead();
    return super.usuarioLogin;
  }

  @override
  set usuarioLogin(UserModel value) {
    _$usuarioLoginAtom.reportWrite(value, super.usuarioLogin, () {
      super.usuarioLogin = value;
    });
  }

  late final _$progressLoginAtom =
      Atom(name: '_LoginStoreBase.progressLogin', context: context);

  @override
  bool get progressLogin {
    _$progressLoginAtom.reportRead();
    return super.progressLogin;
  }

  @override
  set progressLogin(bool value) {
    _$progressLoginAtom.reportWrite(value, super.progressLogin, () {
      super.progressLogin = value;
    });
  }

  late final _$carregandoAtom =
      Atom(name: '_LoginStoreBase.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$RealizarLoginAsyncAction =
      AsyncAction('_LoginStoreBase.RealizarLogin', context: context);

  @override
  Future<dynamic> RealizarLogin() {
    return _$RealizarLoginAsyncAction.run(() => super.RealizarLogin());
  }

  @override
  String toString() {
    return '''
usuarioLogin: ${usuarioLogin},
progressLogin: ${progressLogin},
carregando: ${carregando}
    ''';
  }
}
