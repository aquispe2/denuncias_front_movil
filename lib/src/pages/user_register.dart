import 'dart:io';

import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => new _UserRegisterState();
 }
class _UserRegisterState extends State<UserRegister> {
  final formKey = GlobalKey<FormState>();
    final scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
  key: scaffoldkey,
      appBar: AppBar(
        title: Text('Usuario Nuevo')
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                /*_crearCi(),
                _crearNombreCompleto(),
                _crearPaterno(),
                _crearMaterno()*/
              ],
            ),
          ),
        ),
      ),
    );
   
  }

   Widget _crearCi() {
    return TextFormField(
      /*initialValue: objUsuario.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Denuncia'),
      onSaved: (value) => objUsuario.descripcion = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Denuncia";
        } else {
          return null;
        }
      },*/
    );
  }
}