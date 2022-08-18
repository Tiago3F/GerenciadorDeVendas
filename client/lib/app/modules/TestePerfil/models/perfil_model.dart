import 'dart:convert';

class Perfil {
  int? totalRows;
  Rows rows;

  Perfil({
    this.totalRows,
    required this.rows,
  });

  factory Perfil.fromMap(Map<String, dynamic> json) => Perfil(
        totalRows: json["totalRows"],
        rows: json["rows"],
      );

  factory Perfil.fromJson(Map<String, dynamic> json) {
    return Perfil(
      totalRows: json["totalRows"] as int,
      rows: Rows.fromJson(json["rows"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "totalRows": totalRows,
        "rows": rows,
      };
}

class Rows {
  int? id;
  String? nome;

  Rows({
    this.id,
    this.nome,
  });

  factory Rows.fromMap(Map<String, dynamic> json) => Rows(
        id: json["id"],
        nome: json["nome"],
      );

  factory Rows.fromJson(Map<String, dynamic> json) {
    return Rows(
      id: json["id"] as int,
      nome: json["nome"] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
      };
}
