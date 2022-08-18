import 'package:dio/dio.dart';

import 'package:mobx/mobx.dart';

import '../models/perfil_model.dart';
import '../repositories/perfil_repository.dart';

part 'table_store.g.dart';

class TableStore = _TableStore with _$TableStore;

abstract class _TableStore with Store {
  final PerfilRepository perfilRepository = PerfilRepository();

  //////////////// VALIDAÇÕES ////////////////

  //////////////// CADASTRO PERFIL ////////////////
  // @observable
  // var perfilCreaterModel = PerfilCreaterModel();

  @observable
  String newName = '';

  // setNameCadastro(String value) {
  //   newName = value;
  //   perfilCreaterModel.nome = newName;
  //   print(newName);
  // }

  String? validateName() {
    if (newName.isEmpty) {
      return "Este campo é obrigatório!";
    }

    return null;
  }

  @computed
  bool get isValidName {
    return validateName() == null;
  }

  //////////////// EDIÇÃO PERFIL ////////////////

  // @observable
  // var perfilListModel = PerfilListModel();

  // setNameEditar(String value, int id) {
  //   newName = value;
  //   perfilCreaterModel.nome = newName;
  //   perfilCreaterModel.id = id;
  // }

  String? validateNameEditar() {
    if (newName.isEmpty) {
      return "Este campo é obrigatório!";
    }

    return null;
  }

  @computed
  bool get isValidNameEditar {
    return validateNameEditar() == null;
  }

  //////////////// FUNÇÕES ////////////////

  @action
  Future<bool> postCreatePerfil(nome) async {
    bool success = false;
    try {
      var res = await perfilRepository.cadastraPerfil(nome);
      success = true;
      return res;
    } on DioError catch (err) {
      print('Erro ao realizar cadastro ${err.response?.statusCode}');
    }
    return success;
  }

  @action
  Future<bool> postEditPerfil(id, nome) async {
    bool success = false;
    try {
      var res = await perfilRepository.editaPerfil(id, nome);
      success = true;
      return res;
    } on DioError catch (err) {
      print('Erro ao realizar edição ${err.response?.statusCode}');
    }
    return success;
  }

  @action
  Future<bool> postDeletePerfil(id) async {
    bool success = false;
    try {
      var res = await perfilRepository.excluirPerfil(id);
      success = true;
      return res;
    } on DioError catch (err) {
      print('Erro ao realizar exclusão ${err.response?.statusCode}');
    }
    return success;
  }
}
