import 'package:cadastro_usuario_web/app/modules/auth/auth_module.dart';
import 'package:cadastro_usuario_web/app/modules/auth/store/auth_store.dart';
import 'package:cadastro_usuario_web/app/modules/home/home_module.dart';
import 'package:cadastro_usuario_web/app/modules/home/store/home_store.dart';
import 'package:cadastro_usuario_web/app/modules/login/store/login_store.dart';
import 'package:cadastro_usuario_web/app/modules/registration/registration_module.dart';
import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationStore()),
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute("/", module: LoginModule()),
    ModuleRoute("/registration", module: RegistrationModule()),
    ModuleRoute("/home", module: HomeModule()),


  ];

}