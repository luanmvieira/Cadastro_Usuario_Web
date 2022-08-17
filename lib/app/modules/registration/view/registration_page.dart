import 'package:cadastro_usuario_web/app/modules/login/store/login_store.dart';
import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:cadastro_usuario_web/app/modules/registration/view/registration_desktop.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegistrationPage extends StatefulWidget {

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ModularState<RegistrationPage, RegistrationStore> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff1F1F30),
        body: ScreenTypeLayout(
          desktop: RegistrationDesktop(),
          mobile: RegistrationDesktop(),
        ),
      ),
    );
  }
}