
import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gitens/app/modules/gerenciarConsultas/controllers/client_store.dart';
import 'package:gitens/app/modules/gerenciarConsultas/models/cliente_model.dart';




class ProductTableScreen extends StatefulWidget {
  ProductTableScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _ProductTableScreenState createState() => _ProductTableScreenState();
}

class _ProductTableScreenState extends State<ProductTableScreen> {
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final source = ExampleSource();
  var sortIndex = 0;
  var sortAsc = true;
  final searchController = TextEditingController();

  final ClientStore clientTable = ClientStore();

  @override
  void initState() {
    super.initState();
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all( 20),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                             border: OutlineInputBorder(),
                            labelText: 'Filtrar',
                          ),
                          onSubmitted: (value) {
                            source.filterServerSide(searchController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                  
                  IconButton(
                    onPressed: () =>
                        source.filterServerSide(searchController.text),
                    icon: Icon(Icons.search),
                  ),
                  ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            icon: Icon(Icons.picture_as_pdf),
                            onPressed: () {},
                            label: Text("Gerar PDF"),
                          ),
                ],
              ),
              AdvancedPaginatedDataTable(
                addEmptyRows: false,
                source: source,
                sortAscending: sortAsc,
                sortColumnIndex: sortIndex,
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
                  DataColumn(label: Text('Nome')) ],
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
                    
                    //amountText += ' ($totalRowsWithoutFilter)';
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
}

typedef SelectedCallBack = Function(String id, bool newSelectState);

class ExampleSource extends AdvancedDataTableSource<ClientModel> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  @override
  DataRow? getRow(int index) =>
      lastDetails!.rows[index].getRow(selectedRow, selectedIds);

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

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }



  @override
  Future<RemoteDataSourceDetails<ClientModel>> getNextPage(
      NextPageRequest pageRequest) async {
    final Dio _dio = Dio();

    final response =
        await _dio.get('http://localhost:3333/perfil', queryParameters: {
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      if (lastSearchTerm.isNotEmpty) 'nome': lastSearchTerm,
    });
    if (response.statusCode == 200) {
      final data = response.data;
      return RemoteDataSourceDetails(
        data['totalRows'] as int,
        (data['rows'] as List<dynamic>)
            .map((json) => ClientModel.fromJson(json))
            .toList(),
        filteredRows: lastSearchTerm.isNotEmpty
            ? (data['rows'] as List<dynamic>).length
            : null,
      );
    } else {
      throw Exception('Not found');
    }
  }
}
