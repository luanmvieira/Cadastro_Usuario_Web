import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:cadastro_usuario_web/app/modules/home/views/edit_profile_desktop.dart';
import 'package:cadastro_usuario_web/app/modules/home/views/edit_profile_mobile.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ModularState<EditProfilePage, HomeStore> {
  @override
  void initState() {
    controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xff1F1F30),
        body: ScreenTypeLayout(
          desktop: EditProfileDesktop(),
          mobile: EditProfileMobile(),
        ),
      ),
    );
  }
}