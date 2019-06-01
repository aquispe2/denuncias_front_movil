import 'dart:convert';

import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:http/http.dart' as http;

class CasosProviders{
  final String _url = '172.16.30.51:1550/api';

  Future<bool> crearCasos(CasosModel casos) async{
    final url = '$_url/casos/add';
    final resp = await   http.post(url,body: casosModelToJson(casos));
    final decodeData = json.decode(resp.body);
    print(decodeData);
    return true;
  }
}