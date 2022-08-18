import 'dart:core';
import 'package:dio/dio.dart';
import 'package:gitens/app/modules/clientController/createClient/model/client_model.dart';


const String baseUrl = "http://localhost:3333";

class ClientRepository{
  late List<ClientModel> listClient;
  final Dio _dio = Dio();

  Future listClients() async {
    Response response = await _dio.get<List>("$baseUrl/clientes");
    try{
      if(response.statusCode == 200){
        final data = response.data as List<dynamic>;
        listClient = (data).map((json) {
          return ClientModel.fromJson(json, json: {});
        }).toList();
        return listClient;
      }
      else{
        print("Deu Ruim!!!");
      }
    } catch (e){
      print(e);
    }     
  }

  Future<ClientModel> createClient(ClientModel client) async {
    Response response = await _dio.post("$baseUrl/cliente", data: client);
    print("response: ${response.statusCode}");
    print("response: ${response.data}");
    return ClientModel.fromJson(response.data, json: {});
  } 

  Future<ClientModel> updateClient(ClientModel client) async {
    Response response = await _dio.patch("$baseUrl/cliente/id", data: client);
    print("response: ${response.statusCode}");
    print("response: ${response.data}");
    return ClientModel.fromJson(response.data, json: {});
  }

  Future<ClientModel> removeClient(ClientModel client) async {
    Response response = await _dio.delete("$baseUrl/cliente/id", data: client);
    print("response: ${response.statusCode}");
    print("response: ${response.data}");
    return ClientModel.fromJson(response.data, json: {}) ;
  }

}