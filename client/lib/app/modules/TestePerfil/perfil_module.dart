import 'package:flutter_modular/flutter_modular.dart';

import 'views/perfil_page.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const PerfilPage(), children: []),
  ];
}
