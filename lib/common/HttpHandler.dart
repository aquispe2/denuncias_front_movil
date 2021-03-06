import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nuevoproyecto/model/Casos.dart';
import 'dart:io';


class HttpHandler {
  //final String _baseUrl = "r:1550";
  final String _baseUrl = "192.168.0.14:1550";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

    Future<dynamic> createCaso({Map body}) async{
    print('$_baseUrl/api/casos/add');
    print(body.toString());
    var uri = new Uri.http(_baseUrl,"api/casos/add");
    return http.post(uri,body: json.encode(body),headers: {"Content-Type": "application/json"} ).then((http.Response response){
        final int statusCode = response.statusCode;
        if(statusCode<200 || statusCode > 400 || json==null){
          throw new Exception("Error en la creacion de Caso");
        }
      
    });
  }

  Future<List<Casos>> fetchCasos(){
    print("HOlaaaa");
    var uri =  new Uri.http(_baseUrl,"api/casos/listarTodos");
    return getJson(uri).then(((data)=>
      data.map<Casos>((item)=>new Casos(item)).toList()
      
    ));
  }
}
