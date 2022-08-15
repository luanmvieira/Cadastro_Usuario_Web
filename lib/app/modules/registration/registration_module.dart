
import 'package:cadastro_usuario_web/app/modules/registration/store/registration_store.dart';
import 'package:cadastro_usuario_web/app/modules/registration/view/registration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RegistrationPage()),
  ];
}
