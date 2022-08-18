class ClientModel {
  String? nome;
  String? cpf;
  int? limite;
  int? cc; 


  ClientModel({
    this.nome,
    this.cpf,
    this.limite,
    this.cc,
  });

  factory ClientModel.fromJson(data, {required Map<String, dynamic> json}) { 
    return ClientModel(
      nome: json["nome"],
      cpf: json["cpf"],
      limite: json["limite"],
      cc: json["cc"],
    );
  }

  Map<String, dynamic> toJson() {
    return 
    {
      "nome": nome,
      "cpf": cpf,
      "limite": limite,
      "cc": cc
    };
  }

}











