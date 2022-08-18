import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gitens/app/modules/Perfil/interfaces/perfil_interface.dart';

import '../models/perfil_model.dart';

class PerfilRepository implements PerfilInterface {
  late List<PerfilModel> listPerfil;

  final Dio _dio = Dio();

  @override
  Future<bool> cadastraPerfil(String nome) async {
    bool success = false;

    PerfilModel perfilModel = PerfilModel(nome: nome);

    final apiResponse = await _dio.post('http://localhost:3333/perfil',
        data: perfilModel.toJson());

    if (apiResponse.statusCode == 201) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> editaPerfil(int id, String nome) async {
    bool success = false;

    var data = PerfilModel(id: id, nome: nome).toJson();

    final apiResponse =
        await _dio.put('http://localhost:3333/perfil', data: data);

    if (apiResponse.statusCode == 200) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> excluirPerfil(int id) async {
    bool success = false;

    PerfilModel perfilModel = PerfilModel(id: id);

    final apiResponse = await _dio.delete('http://localhost:3333/perfil/$id',
        data: perfilModel.toJson());

    if (apiResponse.statusCode == 200) {
      print(apiResponse.data);
      success = true;
    } else {
      success = false;
    }

    return success;
  }

  @override
  Future<List<PerfilModel>> listarPerfil() async {
    final apiResponse = await _dio.get('http://localhost:3333/perfil');
    return (apiResponse.data as List)
        .map((item) => PerfilModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<PerfilModel>> getAllPerfis() async {
    List<PerfilModel> perfis = [];

    var apiResponse = await _dio.post('http://localhost:3333/perfil');

    if (apiResponse.statusCode == 200) {
      var pp = apiResponse.data["result"] as List;

      print(jsonEncode(apiResponse.data));
      perfis = pp.map((json) => PerfilModel.fromJson(json)).toList();
    } else {
      perfis = [];
    }

    return perfis;
  }
}
