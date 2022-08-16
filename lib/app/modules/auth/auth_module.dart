
import 'package:cadastro_usuario_web/app/modules/auth/auth_init.dart';
import 'package:cadastro_usuario_web/app/modules/auth/store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InitAuth()),
  ];
}
