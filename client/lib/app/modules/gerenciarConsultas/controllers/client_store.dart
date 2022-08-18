import 'package:gitens/app/modules/gerenciarConsultas/models/cliente_model.dart';
import 'package:mobx/mobx.dart';
part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;

abstract class _ClientStoreBase with Store {
  @observable
  var clientModel = ClientModel();

  


 

  @observable
  late ObservableFuture<List<ClientModel>> dataList;

  @action
  listarPerfis() {
    //dataList = apiService.listaPerfil().asObservable();
  }
  
}