import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/client_repository.dart';
import '../model/client_model.dart';
part 'create_client.g.dart';

class CreateClient = _CreateClientBase with _$CreateClient;

abstract class _CreateClientBase with Store {
  final ClientModel clientModel = ClientModel();
  final ClientRepository clientRepository = ClientRepository();

  @observable
  String? nome;
  String? cpf;
  int? limite;
  int? contaCorrente;

  @action
  void setNameClient(String name){
    nome = name;
    clientModel.nome = nome;
  }

  @action
  void setCpfClient(String cpF){
    cpf = cpF;
    clientModel.cpf = cpf;
  }

  @action
  void setLimitClient(String limit){
    limite = int.parse(limit);
    clientModel.limite = limite;
  }

  @action
  void setCtnCorentClient(String cntCorrente){
    contaCorrente = int.parse(cntCorrente);
    clientModel.cc = contaCorrente;
  }

  void newClient() async{
    _createClient(clientModel);
  }

  Future<ClientModel?> _createClient(ClientModel client) async {
    try{
       var res = clientRepository.createClient(client);
       return res;
    } catch(e){
      print("Deu ruim no cadastro $e");
    }
  }
}