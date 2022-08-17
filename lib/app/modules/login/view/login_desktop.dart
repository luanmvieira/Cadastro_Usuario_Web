import 'package:cadastro_usuario_web/app/modules/login/store/login_store.dart';
import 'package:cadastro_usuario_web/app/modules/login/widgets/custom_login_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class LoginDesktop extends StatelessWidget {
  final LoginStore _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.deepPurpleAccent,//Color(0xff1F1F30)
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Lottie.asset('assets/Lottie/login.json',),
                )
            ),
            Expanded(
                flex: 1,
                child: Observer(
                    builder: (_) => Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      child: CustomLogin(
                          carregando: _controller.carregando,
                          emailController: _controller.loginController,
                          senhaController: _controller.passwordController,
                          store:_controller,
                      ),
                    )
                )
            )
          ],
        ),
      ),

    );
  }
}
