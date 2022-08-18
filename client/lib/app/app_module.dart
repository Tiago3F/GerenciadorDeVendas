import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitens/app/modules/cadastroUsuario/cadastroUsuario_module.dart';

import 'modules/Perfil/menu_module.dart';
import 'modules/TestePerfil/perfil_module.dart';
import 'modules/loginAdmin/login_admin_module.dart';

import 'splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    ModuleRoute('/loginadmin', module: LoginAdminModule()),
    ModuleRoute('/registeradmin', module: MenuAdminModule()),
    ModuleRoute('/cadUser', module: CadastroUsuarioModule()),
    ModuleRoute('/perfil', module: PerfilModule()),
    WildcardRoute(
        child: (_, __) => const Scaffold(
              body: Center(child: Text("A página não existe!")),
            )),
  ];
}
