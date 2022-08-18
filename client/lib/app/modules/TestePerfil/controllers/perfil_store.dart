import 'package:mobx/mobx.dart';

import '../models/perfil_model.dart';
import '../service/perfil_api.dart';
part 'perfil_store.g.dart';

class PerfilStore = _PerfilStoreBase with _$PerfilStore;

abstract class _PerfilStoreBase with Store {
  _PerfilStoreBase(PerfilAPI perfilAPI) : _perfilAPI = perfilAPI;

  PerfilAPI _perfilAPI;

  @observable
  List<dynamic> perfis = [];

  @observable
  bool isLoading = false;

  @action
  Future buscarPerfil() async {
    isLoading = true;
    final perfilList = await _perfilAPI.getPerfis();
    perfis = perfilList;
    isLoading = false;
  }
}
