import 'package:flutter/material.dart';
import '../controllers/client_store.dart';
import '../views/widgets/client_table.dart';

final ClientStore clientStore = ClientStore();

class ClientModel {
  int? id;
  String? nome;

  ClientModel({
    this.id,
    this.nome,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  DataRow getRow(
    SelectedCallBack callback,
    List<String> selectedIds,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(nome!)),
       
      ],
    );
  }
}
