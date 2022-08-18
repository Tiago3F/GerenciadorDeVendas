import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../controllers/perfil_store.dart';
import '../di/locator.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _perfilStore = getIt.get<PerfilStore>();

  @override
  void initState() {
    _perfilStore.buscarPerfil();
    super.initState();
  }

  Future<void> getDados() async {
    await _perfilStore.buscarPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfis"),
      ),
      body: Observer(
        builder: (context) {
          if (_perfilStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: _perfilStore.perfis.length,
            itemBuilder: (context, index) {
              final perfil = _perfilStore.perfis[index];

              return ListTile(
                title: Text('ID: ${perfil['id']}'),
                subtitle: Text('Nome do Perfil: ${perfil['nome']}'),
              );
            },
          );
        },
      ),
    );
  }
}
