import 'package:flutter/material.dart';
import 'package:gitens/app/modules/clientController/createClient/view/widgets/create_modal.dart';

//Cabeçalho da tabela...
class MyData extends DataTableSource {

  initState() {
   
  }

  final List<Map<String, dynamic>> _data = List.generate(
     100,
      (index) => {
            "nome": "Nome Normal de Uma Pessoa Real",
            "cpf": 20123135412,
            "limite": 20345,
            "contaCorrente": 123456,
          });

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['nome'].toString())),
      DataCell(Text(_data[index]['cpf'].toString())),
      DataCell(Text(_data[index]['limite'].toString())),
      DataCell(Text(_data[index]['contaCorrente'].toString())),
      DataCell(
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.black54,
              ),
              hoverColor: Colors.black12,
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black54
              ),
              hoverColor: Colors.black12,
              splashRadius: 20,
            )
          ],
        ),
      ),
    ]);
  }
}

//CORPO DA TABELA
class TableClient extends StatefulWidget {
  const TableClient({Key? key}) : super(key: key);

  @override
  _TableClientState createState() => _TableClientState();
}

class _TableClientState extends State<TableClient> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                source: _data,
                header: const Text('Lista de Clientes'),
                actions: [CreateClienteModal()],
                columns: const [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("CPF")),
                  DataColumn(label: Text("Limite")),
                  DataColumn(label: Text("Conta Corrente")),
                  DataColumn(label: Text("Ações")),
                ],
                columnSpacing: 100,
                horizontalMargin: 20,
                rowsPerPage: 20,
                showCheckboxColumn: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
