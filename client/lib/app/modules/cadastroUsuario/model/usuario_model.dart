class UsuarioModel {
  String? nome;
  String? email;
  String? senha;

  UsuarioModel({
    this.nome,
    this.email,
    this.senha,
  });

  factory UsuarioModel.fromJson(data, {required Map<String, dynamic> json}) {
    return UsuarioModel(
      nome: json["nome"],
      email: json["email"],
      senha: json["senha"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"nome": nome, "email": email, "senha": senha};
  }
}
