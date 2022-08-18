import '../models/perfil_model.dart';

abstract class PerfilInterface {
  Future<bool> cadastraPerfil(String nome);

  Future<bool> editaPerfil(int id, String nome);

  Future<bool> excluirPerfil(int id);

  Future<List<PerfilModel>> listarPerfil();

  Future<List<PerfilModel>> getAllPerfis();
}
