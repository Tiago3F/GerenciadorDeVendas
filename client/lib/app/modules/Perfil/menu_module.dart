import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitens/app/modules/cadastroUsuario/views/cad_usuario_page.dart';
import 'package:gitens/app/modules/clientController/page/client_page.dart';
import 'package:gitens/app/modules/gerenciarConsultas/views/consult_page.dart';

import 'controllers/table_store.dart';
import 'views/menu_page.dart';
import 'views/widgets/table_perfil.dart';

class MenuAdminModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TableStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const MenuPage(), children: [
      ChildRoute(
        '/perfil',
        child: (_, __) => MyHomePage(),
        transition: TransitionType.noTransition,
      ),
      ChildRoute(
        '/cadUser',
        child: (_, __) => const CadastroUserPage(),
      ),
      ChildRoute(
        '/cliente',
        child: (_, __) => ClientPage(),
        transition: TransitionType.noTransition,
      ),
      ChildRoute(
        '/consultas',
        child: (_, __) => ConsultasPage(),
        transition: TransitionType.noTransition,
      ),
    ]),
  ];
}
