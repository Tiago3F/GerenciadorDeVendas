import 'package:get_it/get_it.dart';

import '../controllers/perfil_store.dart';
import '../service/perfil_api.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(PerfilAPI());
  getIt.registerSingleton(PerfilStore(getIt.get<PerfilAPI>()));
}
