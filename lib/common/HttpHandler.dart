import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nuevoproyecto/model/Casos.dart';
class HttpHandler {
  //final String _baseUrl = "172.16.30.51:1550";
  final String _baseUrl = "192.168.0.14:1550";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Casos>> fetchCasos(){
    var uri =  new Uri.http(_baseUrl,"api/casos/listarTodos");

    /*return getJson(uri).then(((data)=>data.toString()
    ));*/

//[{caso_id: 1, descripcion: holaaaaaaaaaaaaaaa, usuario_id: 1029}, {caso_id: 2, descripcion: holaaaaaaaaaaaaaaa, usuario_id: 1029}]

    return getJson(uri).then(((data)=>
      data.map<Casos>((item)=>new Casos(item)).toList()
    ));
  }
}
