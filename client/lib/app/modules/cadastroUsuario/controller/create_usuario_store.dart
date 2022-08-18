import 'package:gitens/app/modules/cadastroUsuario/model/usuario_model.dart';
import 'package:mobx/mobx.dart';
import '../repositories/usuario_repository.dart';

part 'create_usuario_store.g.dart';

class CreateUsuario = _CreateUsuarioBase with _$CreateUsuario;

abstract class _CreateUsuarioBase with Store {
  final UsuarioModel usuarioModel = UsuarioModel();

  final UsuarioRepository usuarioRepository = UsuarioRepository();

  @observable
  String? nome;
  String? email;
  String? senha;

  @action
  void setNameUsuario(String name) {
    nome = name;
    usuarioModel.nome = nome;
  }

  @action
  void setEmailUsuario(String emaiL) {
    email = emaiL;
    usuarioModel.email = email;
  }

  @action
  void setSenhaUsuario(String password) {
    senha = password;
    usuarioModel.senha = senha;
  }

  void newUsuario() async {
    _createUsuario(usuarioModel);
  }

  Future<UsuarioModel?> _createUsuario(UsuarioModel user) async {
    try {
      var res = usuarioRepository.createUsuario(user);
    } catch (e) {
      print("Erro ao cadastrar $e");
    }
  }
}
