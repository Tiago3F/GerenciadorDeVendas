import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gitens/app/modules/cadastroUsuario/controller/create_usuario_store.dart';

class ModalCadastrarUsuario extends StatelessWidget {
  ModalCadastrarUsuario({Key? key}) : super(key: key);

  final CreateUsuario criarUsuario = CreateUsuario();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.person_add),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff47afc9)),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          "Novo Usuario",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nome ',
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(Icons.password),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Text("Cadastrar"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff47afc9)),
                    ),
                    onPressed: () {
                      criarUsuario.newUsuario();
                      Navigator.pop(context);
                    }),
                ElevatedButton(
                  child: Text('Cancelar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 235, 26, 26)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
