import 'package:cadastro_usuario_web/app/modules/login/store/login_store.dart';
import 'package:cadastro_usuario_web/app/modules/login/widgets/custom_login_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginMobile extends StatelessWidget {
  final LoginStore _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,//Color(0xff1F1F30)
          ),
          child: Observer(
            builder: (_) => CustomLogin(
                      paddingHorizontal: 30.0,
                      carregando: _controller.progressLogin,
                      emailController: _controller.loginController,
                      senhaController: _controller.passwordController,
                      store:_controller,
                  )

          ),
        ),

      );
  }
}
