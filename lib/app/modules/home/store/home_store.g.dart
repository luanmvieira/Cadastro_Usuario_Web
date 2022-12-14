// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$userModelHomeAtom =
      Atom(name: 'HomeStoreBase.userModelHome', context: context);

  @override
  UserModel get userModelHome {
    _$userModelHomeAtom.reportRead();
    return super.userModelHome;
  }

  @override
  set userModelHome(UserModel value) {
    _$userModelHomeAtom.reportWrite(value, super.userModelHome, () {
      super.userModelHome = value;
    });
  }

  late final _$resultEditUsuarioAtom =
      Atom(name: 'HomeStoreBase.resultEditUsuario', context: context);

  @override
  bool get resultEditUsuario {
    _$resultEditUsuarioAtom.reportRead();
    return super.resultEditUsuario;
  }

  @override
  set resultEditUsuario(bool value) {
    _$resultEditUsuarioAtom.reportWrite(value, super.resultEditUsuario, () {
      super.resultEditUsuario = value;
    });
  }

  late final _$nameCurrentUserAtom =
      Atom(name: 'HomeStoreBase.nameCurrentUser', context: context);

  @override
  String get nameCurrentUser {
    _$nameCurrentUserAtom.reportRead();
    return super.nameCurrentUser;
  }

  @override
  set nameCurrentUser(String value) {
    _$nameCurrentUserAtom.reportWrite(value, super.nameCurrentUser, () {
      super.nameCurrentUser = value;
    });
  }

  late final _$logOutstateAtom =
      Atom(name: 'HomeStoreBase.logOutstate', context: context);

  @override
  bool get logOutstate {
    _$logOutstateAtom.reportRead();
    return super.logOutstate;
  }

  @override
  set logOutstate(bool value) {
    _$logOutstateAtom.reportWrite(value, super.logOutstate, () {
      super.logOutstate = value;
    });
  }

  late final _$deleteStateAtom =
      Atom(name: 'HomeStoreBase.deleteState', context: context);

  @override
  bool get deleteState {
    _$deleteStateAtom.reportRead();
    return super.deleteState;
  }

  @override
  set deleteState(bool value) {
    _$deleteStateAtom.reportWrite(value, super.deleteState, () {
      super.deleteState = value;
    });
  }

  late final _$currentUserModelAtom =
      Atom(name: 'HomeStoreBase.currentUserModel', context: context);

  @override
  UserModel get currentUserModel {
    _$currentUserModelAtom.reportRead();
    return super.currentUserModel;
  }

  @override
  set currentUserModel(UserModel value) {
    _$currentUserModelAtom.reportWrite(value, super.currentUserModel, () {
      super.currentUserModel = value;
    });
  }

  late final _$getValidatorAtom =
      Atom(name: 'HomeStoreBase.getValidator', context: context);

  @override
  bool get getValidator {
    _$getValidatorAtom.reportRead();
    return super.getValidator;
  }

  @override
  set getValidator(bool value) {
    _$getValidatorAtom.reportWrite(value, super.getValidator, () {
      super.getValidator = value;
    });
  }

  late final _$deleteValidatorAtom =
      Atom(name: 'HomeStoreBase.deleteValidator', context: context);

  @override
  bool get deleteValidator {
    _$deleteValidatorAtom.reportRead();
    return super.deleteValidator;
  }

  @override
  set deleteValidator(bool value) {
    _$deleteValidatorAtom.reportWrite(value, super.deleteValidator, () {
      super.deleteValidator = value;
    });
  }

  late final _$resultadoAtom =
      Atom(name: 'HomeStoreBase.resultado', context: context);

  @override
  bool get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(bool value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('HomeStoreBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$logOutAsyncAction =
      AsyncAction('HomeStoreBase.logOut', context: context);

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('HomeStoreBase.deleteUser', context: context);

  @override
  Future<dynamic> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$retornarInfosCepAsyncAction =
      AsyncAction('HomeStoreBase.retornarInfosCep', context: context);

  @override
  Future retornarInfosCep(String cep) {
    return _$retornarInfosCepAsyncAction.run(() => super.retornarInfosCep(cep));
  }

  late final _$EditarUserAsyncAction =
      AsyncAction('HomeStoreBase.EditarUser', context: context);

  @override
  Future EditarUser() {
    return _$EditarUserAsyncAction.run(() => super.EditarUser());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void checkUserLoggedIn() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.checkUserLoggedIn');
    try {
      return super.checkUserLoggedIn();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel userSet) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setUser');
    try {
      return super.setUser(userSet);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetUser() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetUser');
    try {
      return super.resetUser();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModelHome: ${userModelHome},
resultEditUsuario: ${resultEditUsuario},
nameCurrentUser: ${nameCurrentUser},
logOutstate: ${logOutstate},
deleteState: ${deleteState},
currentUserModel: ${currentUserModel},
getValidator: ${getValidator},
deleteValidator: ${deleteValidator},
resultado: ${resultado}
    ''';
  }
}
