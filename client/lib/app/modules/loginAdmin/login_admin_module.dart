import 'package:flutter_modular/flutter_modular.dart';

import 'views/login_admin_page.dart';

class LoginAdminModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => LoginAdminPage(),
        ),
      ];
}
