import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStoreBase with _$RegistrationStore;
abstract class _RegistrationStoreBase with Store {
  final nameController = TextEditingController();

  bool validateNameField(String name) {
    if (name != null && name.length != 0 && name.length > 6) return true;

    return false;
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}