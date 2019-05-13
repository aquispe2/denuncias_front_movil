import 'package:flutter/material.dart';
import 'package:nuevoproyecto/model/PostCasos.dart';
import 'package:nuevoproyecto/common/HttpHandler.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new FormDenuncias(),
));

class FormDenuncias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormDenuncias();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _FormDenuncias extends State<FormDenuncias> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
TextEditingController descripcionEdit = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(

      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: descripcionEdit,
                  decoration: InputDecoration(
                      hintText: "Describa la Denuncia"),
                ),
                /*new TextFormField(
                  
                  controller: descripcionEdit,
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Describa la Denuncia',
                        labelText: 'Denuncia'
                    )
                ),*/

                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Enviar',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () async {
                      PostCasos newPostCasos = new PostCasos( descripcion:descripcionEdit.text, usuario_id:10, estado_id:10);
                      await HttpHandler().createCaso(body: newPostCasos.toMap());
                    },
                    color: Colors.green,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}