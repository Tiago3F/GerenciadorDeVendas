import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitens/app/modules/gerenciarConsultas/views/consult_page.dart';


class ConsultasModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const ConsultasPage(), children: [
      ChildRoute(
        '/consultas',
        child: (_, __) => ConsultasPage(),
        transition: TransitionType.noTransition,
      ),
    ]),
  ];
}
