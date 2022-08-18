import 'package:dio/dio.dart';
import 'package:gitens/app/modules/gerenciarConsultas/models/cliente_mode.dart';
import 'package:gitens/app/modules/gerenciarConsultas/models/cliente_model.dart';


class ApiService {
  late List<ClientModel> listaPerfil;
  final Dio _dio = Dio();
  Future<List<ClientModel>> listarPerfil() async {
    final apiResponse = await _dio.get('http://localhost:3333/cliente?nome=');
    return (apiResponse.data as List)
        .map((perfil) => ClientModel.fromJson(perfil))
        .toList();
  }
}
