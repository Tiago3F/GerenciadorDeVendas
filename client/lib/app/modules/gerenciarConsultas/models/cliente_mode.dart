// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';


// //import '../views/widgets/table_perfil.dart';

// final ClientStore clientStore = ClientStore();

// class ClientModel {
//   int? id;
//   String? nome;

//   ClientModel({
//     this.id,
//     this.nome,
//   });


//   factory ClientModel.fromJson(Map<String, dynamic> json) {
//     return ClientModel(
//       id: json['id'],
//       nome: json['nome'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'nome': nome,
//     };
//   }

//   DataRow getRow(
//     SelectedCallBack callback,
//     List<String> selectedIds,
//   ) {
//     return DataRow(
//       cells: [
//         DataCell(Text(id.toString())),
//         DataCell(Text(nome!)),
       
//       ],
//     );
//   }
// }
