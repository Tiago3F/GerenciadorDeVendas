import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitens/app/modules/gerenciarConsultas/models/client_model.dart';
import 'package:gitens/app/modules/gerenciarConsultas/views/widgets/client_table.dart';
import 'package:gitens/app/modules/gerenciarConsultas/views/widgets/product_table.dart';
import 'package:gitens/app/modules/gerenciarConsultas/views/widgets/sales_table.dart';
//import 'widgets/info_system.dart';

class ConsultasPage extends StatefulWidget {
  const ConsultasPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConsultasPageData();
  }
}

class ConsultasPageData extends State<ConsultasPage>
    with TickerProviderStateMixin {
  late TabController _tabControllerUser;
  List<Cliente> _usuarios = [];
  int _rowsPerPage = 5;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _tabControllerUser = TabController(length: 3, vsync: this, initialIndex: 0);
    _scrollController = ScrollController();
    List.generate(
        50,
        (index) => _usuarios.add(Cliente(
            codigo: index,
            nome: "Name $index",
            endereco: "Endereço $index",
            email: "email $index",
            telefone: "telefone $index")));
  }

  @override
  void dispose() {
    super.dispose();
    _tabControllerUser.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              controller: _tabControllerUser,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.people_alt_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Todos os Clientes"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.production_quantity_limits_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Produtos"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.shopify_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Vendas"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("CONTROLE DE CLIENTES")],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabControllerUser,
              children:  [
                ///TAB DE CLIENTES

                ClientTableScreen(),
                ///TAB DE PRODUTOS

                ProductTableScreen(),

                ///TAB DE VENDAS

                SalesTableScren()
              ],
            ),
          )
        ],
      ),
    );
  }
}

