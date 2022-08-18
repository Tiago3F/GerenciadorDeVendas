import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gitens/app/modules/clientController/createClient/controller/create_client.dart';

class CreateClienteModal extends StatelessWidget {
  CreateClienteModal({Key? key}) : super(key: key);
  final loading = ValueNotifier<bool>(false);
  final CreateClient cliente = CreateClient();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Novo Cliente",
          style: TextStyle(),
        ),
      ),
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 29, 163, 11)),
        elevation: MaterialStateProperty.all(3),
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
                        const Text("Novo Cliente",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),                        
                        ),

                        const SizedBox(height: 30,),

                        Observer(
                          builder: (_) => TextFormField(
                            onChanged: cliente.setNameClient,
                            decoration: InputDecoration(
                              labelText: 'Nome ',
                              hintText: "Insira o nome completo",
                              icon: Icon(Icons.account_box),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10,),

                        Observer(
                          builder: (_) => TextFormField(                            
                            onChanged: cliente.setCpfClient,
                            maxLength: 11,
                            decoration: InputDecoration(
                              labelText: 'CPF ',
                              hintText: "Insira o CPF",
                              icon: Icon(Icons.onetwothree_rounded),   
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),                         
                            ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),

                        const SizedBox(height: 10,),
                        
                        Observer(
                          builder: (_) => TextFormField(
                            onChanged: cliente.setLimitClient,
                            maxLength: 5,
                            decoration: InputDecoration(
                            labelText: 'Limite ',
                            hintText: "Informe o limite disponível",
                            icon: Icon(Icons.attach_money_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),

                        const SizedBox(height: 10,),
                        

                        Observer(
                          builder: (_) => TextFormField(
                            onChanged: cliente.setCtnCorentClient,
                            maxLength: 5,
                            decoration: InputDecoration(
                            labelText: 'Conta Corrente ',
                            hintText: "Informe a conta corrente",
                            icon: Icon(Icons.credit_card_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),                         
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20, bottom: 20),
                  child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Enviar"),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 29, 163, 11)),
                      ),
                      onPressed: () {                        
                        cliente.newClient();
                        print("Chegou aki!");
                        Navigator.pop(context);                        
                      }),
                )
              ],
            );
          },
        );
      },
    );
  }
}
