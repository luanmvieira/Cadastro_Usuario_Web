import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final String title;
  const RegistrationPage({Key? key, this.title = 'RegistrationPage'}) : super(key: key);
  @override
  RegistrationPageState createState() => RegistrationPageState();
}
class RegistrationPageState extends State<RegistrationPage> {
  final RegistrationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}