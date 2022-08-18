import 'package:dio/dio.dart';
import 'package:gitens/app/modules/cadastroUsuario/model/usuario_model.dart';

const String baseUrl = "http://localhost:3333";

class UsuarioRepository {
  late List<UsuarioModel> listUsuario;
  final Dio _dio = Dio();

  Future listUsuarios() async {
    Response response = await _dio.get<List>("$baseUrl/usuarios");
    try {
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        listUsuario = (data).map((json) {
          return UsuarioModel.fromJson(json, json: {});
        }).toList();
        return listUsuario;
      } else {
        print("Erro ao inserir dados de usuarios");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UsuarioModel> createUsuario(UsuarioModel user) async {
    Response response = await _dio.post("$baseUrl/usuario", data: user);
    print("response: ${response.statusCode}");
    print("response: ${response.data}");
    return UsuarioModel.fromJson(response.data, json: {});
  }
}
