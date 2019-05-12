import 'package:flutter/material.dart';
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
                new TextFormField(
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Describa la Denuncia',
                        labelText: 'Denuncia'
                    )
                ),

                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Enviar',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      //await HttpHandler().fetchCasos();
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