import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'store/auth_store.dart';

class InitAuth extends StatefulWidget {
  @override
  _InitAuthState createState() => _InitAuthState();
}

class _InitAuthState extends ModularState<InitAuth, AuthStore> {
  @override
  void initState() {
    controller.VerificarUserLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1F1F30),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: SpinKitWave(color: Colors.white, size: 45,))
            ],
          ),
        )
    );
  }
}
