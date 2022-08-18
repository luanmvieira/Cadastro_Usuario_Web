import 'package:cadastro_usuario_web/app/modules/login/store/login_store.dart';
import 'package:cadastro_usuario_web/app/modules/login/view/login_desktop.dart';
import 'package:cadastro_usuario_web/app/modules/login/view/login_mobile.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff1F1F30),
        body: ScreenTypeLayout(
          desktop: LoginDesktop(),
          mobile: LoginMobile(),
        ),
      ),
    );
  }
}