import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:http/http.dart' as http;

class CasosProviders {
  final String _url = '172.16.30.51:2018';

 Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

Future<List<CasosModel>> cargarCasos(){
    var uri =  new Uri.http(_url,"api/casos/listarTodos");
    Future<List<CasosModel>> lstCasoModel = getJson(uri).then(((data)=>
      data.map<CasosModel>((item)=> new CasosModel.fromJson(item)).toList()
    ));
    return lstCasoModel;

  }

  Future<bool> crearCasos(CasosModel casos) async {
    var url = new Uri.http(_url, "api/casos/add");
    final resp = await http.post(url,
        body: casosModelToJson(casos),
        headers: {"Content-Type": "application/json"});
    final decodeData = json.decode(resp.body);
    print(decodeData);
    return true;
  }

  Future<String> subirImagen (File img) async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/aquispe/image/upload?upload_preset=supochmq');
    final mimeType = mime(img.path).split('/');
    final imgUpload = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath('file', img.path, contentType: MediaType(mimeType[0],mimeType[1]));

    imgUpload.files.add(file);

    final streamResponse = await imgUpload.send();

    final resp = await http.Response.fromStream(streamResponse);
    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print("Subiendo Imagen");
    print(respData);
    return respData['secure_url'];

    

  }

}
