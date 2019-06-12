import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nuevoproyecto/src/models/usuario_model.dart';
import 'package:nuevoproyecto/src/providers/usuario_provider.dart';

class UsuarioNuevoPage extends StatefulWidget {
  @override
  _DenunciasPageState createState() => _DenunciasPageState();
}

class _DenunciasPageState extends State<UsuarioNuevoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  UsuarioModel objUsuario = new UsuarioModel();
  bool _guardando = false;
  File foto;

  final casoProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    final UsuarioModel casoProvider = ModalRoute.of(context).settings.arguments;
    if (casoProvider != null) {
      objUsuario = casoProvider;
    }

    return new Scaffold(
      key: scaffoldkey,
       appBar: AppBar(
        title: Text('Denuncias'),
        actions: <Widget>[
          
        ],
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearCi(),
                _crearMail(),
                _crearNombre(),
                _crearPaterno(),
                _crearMaterno(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearCi() {
    return TextFormField(
      initialValue: objUsuario.ci,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su CI.'),
      onSaved: (value) => objUsuario.ci = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Carnet de Indentidad";
        } else {
          return null;
        }
      },
    );
  }

   Widget _crearMail() {
    return TextFormField(
      initialValue: objUsuario.mail,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Correo Electrónico.'),
      onSaved: (value) => objUsuario.mail = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Carnet Correo Electrónico";
        } else {
          return null;
        }
      },
    );
  }

   Widget _crearNombre() {
    return TextFormField(
      initialValue: objUsuario.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Nombre Completo.'),
      onSaved: (value) => objUsuario.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Nombre Completo";
        } else {
          return null;
        }
      },
    );
  }

   Widget _crearPaterno() {
    return TextFormField(
      initialValue: objUsuario.paterno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Apellido Paterno.'),
      onSaved: (value) => objUsuario.paterno = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Apellido Paterno";
        } else {
          return null;
        }
      },
    );
  }

   Widget _crearMaterno() {
    return TextFormField(
      initialValue: objUsuario.materno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Apellido Materno.'),
      onSaved: (value) => objUsuario.materno = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Apellido Materno";
        } else {
          return null;
        }
      },
    );
  }
  
  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar Usuario'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    setState(() {
      _guardando = true;
    });
    
    casoProvider.crearUsuario(objUsuario);

    setState(() {
      _guardando = false;
    });
    mostrarSnackbar('Registro Guardado');
     Navigator.pushReplacementNamed(context, 'login');
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldkey.currentState.showSnackBar(snackbar);
  }
}
