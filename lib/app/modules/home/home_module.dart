import 'package:cadastro_usuario_web/app/modules/home/views/edit_profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'store/home_store.dart';

import 'views/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute('/', child: (_, args) => HomePage()),
   ChildRoute('/profile', child: (_, args) => EditProfilePage()),
 ];
}