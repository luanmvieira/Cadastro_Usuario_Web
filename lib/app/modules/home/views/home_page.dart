import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:cadastro_usuario_web/app/modules/home/views/home_desktop.dart';
import 'package:cadastro_usuario_web/app/modules/home/views/home_mobile.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff1F1F30),
        body: ScreenTypeLayout(
          desktop: HomeDesktop(),
          mobile: HomeMobile(),
        ),
      ),
    );
  }
}