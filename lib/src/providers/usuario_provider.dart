import 'dart:convert';

import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:http/http.dart' as http;
import 'package:nuevoproyecto/src/models/usuario_model.dart';

class UsuarioProvider {
  final String _url = '172.16.30.51:2018';



  Future<bool> crearUsuario(UsuarioModel usuario) async {
    var url = new Uri.http(_url, "api/usuario/InsertOrUpdateUsuarioMovil");
    final resp = await http.post(url,
        body: usuarioModelToJson(usuario),
        headers: {"Content-Type": "application/json"});
    final decodeData = json.decode(resp.body);
    print(decodeData);
    return true;
  }
  Future<bool> verificarUsuario(UsuarioModel usuario) async{
    
    var url = new Uri.http(_url, "api/usuario/verificarUsuario");
    final resp = await http.post(url,
        body: usuarioModelToJson(usuario),
        headers: {"Content-Type": "application/json"});
    final decodeData = json.decode(resp.body);
    print(decodeData);
    return true;
  }
}



