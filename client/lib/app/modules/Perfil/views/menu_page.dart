import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff235b69),
                    Color(0xFF2b798c),
                    Color(0xFF47afc9),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.playlist_add_check_circle_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Text(
                          'GItens',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            //letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 12),
                    ),
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.featured_play_list_outlined),
                    title: const Text('Cadastrar Perfis'),
                    onTap: () {
                      Modular.to.navigate('./perfil');
                    },
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.person),
                    title: const Text('Cadastrar Usuario'),
                    onTap: () {
                      Modular.to.navigate('./cadUser');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.people_alt_rounded),
                    title: const Text('Clientes'),
                    onTap: () {
                      Modular.to.navigate('./cliente');
                    },
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.search_rounded),
                    title: const Text('Consultas'),
                    onTap: () {
                      Modular.to.navigate('./consultas');
                    },
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Sobre'),
                    onTap: () {
                      Modular.to.navigate('./sobre');
                    },
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}
