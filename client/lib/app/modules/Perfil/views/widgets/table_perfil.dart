import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitens/app/modules/Perfil/repositories/perfil_repository.dart';

import '../../controllers/table_store.dart';
import '../../models/perfil_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final source = ExampleSource();
  var sortIndex = 0;
  var sortAsc = true;
  final searchController = TextEditingController();

  final TableStore controllerTable = TableStore();

  TextEditingController controllerNome = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Buscar nome do perfil',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff47afc9)),
                          ),
                        ),
                        onSubmitted: (value) {
                          source.filterServerSide(searchController.text);
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        source.filterServerSide(searchController.text),
                    icon: const Icon(Icons.search),
                  ),
                  ElevatedButton(
                    child: Text("Cadastrar Perfil"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 76, 175, 80),
                    ),
                    onPressed: () {
                      CoolAlert.show(
                        width: 500,
                        confirmBtnText: "Cadastrar",
                        confirmBtnColor: Color(0xff235b69),
                        context: context,
                        type: CoolAlertType.custom,
                        backgroundColor: Color(0xff235b69),
                        widget: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                  child: Text(
                                "Cadastrar Perfil",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'O nome do perfil é obrigatório';
                                  }
                                  return null;
                                },
                                controller: controllerNome,
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  hintText: 'Insira o nome do perfil',
                                  icon: const Icon(
                                    Icons.account_box,
                                    color: Color(0xff47afc9),
                                  ),
                                  // errorText:
                                  //     controllerTable.validateName(),
                                  labelStyle: const TextStyle(
                                      fontSize: 15, color: Color(0xff47afc9)),
                                  errorStyle:
                                      const TextStyle(color: Colors.red),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff47afc9)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onConfirmBtnTap: () async {
                          if (_formKey.currentState!.validate()) {
                            bool create = await controllerTable
                                .postCreatePerfil(controllerNome.text);

                            if (create) {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.success,
                                  backgroundColor: Color(0xff235b69),
                                  confirmBtnColor: Color(0xff235b69),
                                  title: "Sucesso",
                                  text: "Perfil cadastrado com sucesso");

                              source.reloadPage();
                            } else {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.error,
                                  title: "Falha",
                                  text:
                                      "Ocorreu uma falha ao cadastrar o perfil");
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              AdvancedPaginatedDataTable(
                addEmptyRows: false,
                source: source,
                sortAscending: sortAsc,
                sortColumnIndex: sortIndex,
                loadingWidget: loadDadosTable,
                errorWidget: loadErrosTable,
                showFirstLastButtons: true,
                rowsPerPage: rowsPerPage,
                availableRowsPerPage: const [5, 10, 15],
                onRowsPerPageChanged: (newRowsPerPage) {
                  if (newRowsPerPage != null) {
                    setState(() {
                      rowsPerPage = newRowsPerPage;
                    });
                  }
                },
                columns: const [
                  DataColumn(label: Text('ID'), numeric: false),
                  DataColumn(label: Text('Nome do Perfil')),
                  DataColumn(label: Text('Editar')),
                  DataColumn(label: Text('Excluir')),
                ],
                //Optianl override to support custom data row text / translation
                getFooterRowText:
                    (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
                  final localizations = MaterialLocalizations.of(context);
                  var amountText = localizations.pageRowsInfoTitle(
                    startRow,
                    pageSize,
                    totalFilter ?? totalRowsWithoutFilter,
                    false,
                  );

                  if (totalFilter != null) {
                    //Filtered data source show addtional information
                    amountText += ' Filtrado de ($totalRowsWithoutFilter)';
                  }

                  return amountText;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSort(int i, bool asc) => setState(() {
        sortIndex = i;
        sortAsc = asc;
      });

  Widget loadDadosTable() {
    return const Center(
      heightFactor: 10,
      child: CircularProgressIndicator(
          backgroundColor: Colors.grey, color: Color(0xff47afc9)),
    );
  }

  Widget loadErrosTable() {
    return const Center(heightFactor: 10, child: Text("Carregando dados..."));
  }
}

typedef SelectedCallBack = Function(String id, bool newSelectState);

class ExampleSource extends AdvancedDataTableSource<PerfilModel> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  final _formKey = GlobalKey<FormState>();

  // @override
  // DataRow? getRow(int index) =>
  //     lastDetails!.rows[index].getRow(selectedRow, selectedIds);

  @override
  DataRow getRow(int index) {
    TextEditingController controllerENome = TextEditingController();
    final TableStore controllerTable = TableStore();

    lastDetails!.rows[index];
    return DataRow(
      cells: [
        DataCell(Text("${lastDetails!.rows[index].id}")),
        DataCell(Text("${lastDetails!.rows[index].nome}")),
        DataCell(
          Row(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                      tooltip: "Editar",
                      onPressed: () {
                        controllerENome.text = lastDetails!.rows[index].nome!;

                        CoolAlert.show(
                          width: 500,
                          type: CoolAlertType.confirm,
                          text: "Deseja mesmo editar esse perfil?",
                          title: "Atenção",
                          cancelBtnText: "Não",
                          backgroundColor: Color(0xff235b69),
                          confirmBtnColor: Color(0xff235b69),
                          confirmBtnText: "Sim, editar",
                          context: context,
                          widget: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome do perfil é obrigatório';
                                    }
                                    return null;
                                  },
                                  // initialValue: lastDetails!.rows[index].nome,
                                  controller: controllerENome,
                                  decoration: InputDecoration(
                                    labelText: 'Nome do perfil',
                                    // errorText: controllerTable
                                    //     .validateNameEditar(),
                                    icon: const Icon(
                                      Icons.account_box,
                                      color: Color(0xff47afc9),
                                    ),
                                    labelStyle: const TextStyle(
                                        fontSize: 15, color: Color(0xff47afc9)),
                                    errorStyle:
                                        const TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff47afc9)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          onConfirmBtnTap: () async {
                            if (_formKey.currentState!.validate()) {
                              bool create =
                                  await controllerTable.postEditPerfil(
                                      lastDetails!.rows[index].id!,
                                      controllerENome.text);

                              if (create) {
                                Modular.to.pop();
                                CoolAlert.show(
                                    width: 500,
                                    context: context,
                                    type: CoolAlertType.success,
                                    backgroundColor: Color(0xff235b69),
                                    confirmBtnColor: Color(0xff235b69),
                                    title: "Sucesso",
                                    text: "Perfil editado com sucesso");

                                reloadPage();
                              } else {
                                Modular.to.pop();
                                CoolAlert.show(
                                    width: 500,
                                    context: context,
                                    type: CoolAlertType.error,
                                    title: "Falha",
                                    text:
                                        "Ocorreu uma falha ao editar o perfil");
                              }
                            }
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color(0xFF2b798c),
                      ));
                },
              ),
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    tooltip: "Excluir",
                    onPressed: () async {
                      await CoolAlert.show(
                          width: 500,
                          context: context,
                          type: CoolAlertType.confirm,
                          text: "Deseja mesmo excluir esse perfil?",
                          title: "Atenção",
                          cancelBtnText: "Não",
                          backgroundColor: Color(0xff235b69),
                          confirmBtnText: "Sim, excluir",
                          confirmBtnColor: Color(0xff235b69),
                          onConfirmBtnTap: () async {
                            bool delete = await controllerTable
                                .postDeletePerfil(lastDetails!.rows[index].id!);

                            if (delete) {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.success,
                                  backgroundColor: Color(0xff235b69),
                                  confirmBtnColor: Color(0xff235b69),
                                  title: "Sucesso",
                                  text: "Perfil excluído com sucesso");

                              reloadPage();
                            } else {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.error,
                                  title: "Falha",
                                  text:
                                      "Ocorreu uma falha ao eliminar o perfil");
                            }
                          },
                          onCancelBtnTap: () {
                            Modular.to.pop();
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
      // onSelectChanged: (newState) {
      //   callback(id.toString(), newState ?? false);
      // },
      // selected: selectedIds.contains(id.toString()),
    );
  }

  @override
  int get selectedRowCount => selectedIds.length;

  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) async {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  void reloadPage() async {
    setNextView();
  }

  // var dataMock = {
  //   "totalRows": 10,
  //   "rows": [
  //     {"id": 1, "companyName": "Orn"},
  //     {"id": 2, "companyName": "Put"},
  //     {"id": 3, "companyName": "sss"},
  //     {"id": 4, "companyName": "kkk"},
  //     {"id": 5, "companyName": "kkk"},
  //     {"id": 6, "companyName": "kkk"},
  //     {"id": 7, "companyName": "kkk"},
  //     {"id": 8, "companyName": "kkk"},
  //     {"id": 9, "companyName": "kkk"},
  //     {"id": 10, "companyName": "kkk"}
  //   ]
  // };

  @override
  Future<RemoteDataSourceDetails<PerfilModel>> getNextPage(
      NextPageRequest pageRequest) async {
    final Dio _dio = Dio();

    final response =
        await _dio.get('http://localhost:3333/perfil', queryParameters: {
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      if (lastSearchTerm.isNotEmpty) 'nome': lastSearchTerm,
    });
    if (response.statusCode == 200) {
      // final data = dataMock;
      final data = response.data;

      return RemoteDataSourceDetails(
        data['totalRows'] as int,
        (data['rows'] as List<dynamic>)
            .map((json) => PerfilModel.fromJson(json))
            .toList(),
        filteredRows: lastSearchTerm.isNotEmpty
            ? (data['rows'] as List<dynamic>).length
            : null,
      );
    } else {
      throw Exception('Erro de dados');
    }
  }
}
