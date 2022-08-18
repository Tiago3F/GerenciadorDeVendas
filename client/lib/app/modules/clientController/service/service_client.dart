import 'dart:core';
import 'package:dio/dio.dart';
import '../createClient/model/client_model.dart';

class ClientService {
  late List<ClientModel> listClient;

  final Dio _dio = Dio();

  Future ListClient() async {
    final apiResponse = await _dio.get<List>('http://localhost:3333/cliente');
    if (apiResponse.statusCode == 200) {
      final data = apiResponse.data as List<dynamic>;
      listClient = (data).map((json) {
        return ClientModel.fromJson(json, json: {});
      }).toList();
      return listClient;
    } else {
      print("Erro!");
    }
  }

}