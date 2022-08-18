import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/perfil_model.dart';
import 'package:http/http.dart' as http;

class PerfilAPI {
  Future<List> getPerfis() async {
    List<Perfil> list;

    final uri =
        Uri.parse('http://localhost:3333/perfil').replace(queryParameters: {
      'offset': '0',
      'pageSize': '10',
    });

    try {
      final res = await http.get(uri);

      final json = "[" + res.body + "]";

      var data = jsonDecode(res.body);
      var rest = data["rows"] as List;
      print(rest);

      return rest;

      // var rest = data["rows"] as List;
      // print(rest);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
