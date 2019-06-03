import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:nuevoproyecto/src/providers/casos_providers.dart';
import 'package:image_picker/image_picker.dart';

class DenunciasPage extends StatefulWidget {
  @override
  _DenunciasPageState createState() => _DenunciasPageState();
}

class _DenunciasPageState extends State<DenunciasPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  CasosModel objCasos = new CasosModel();
  bool _guardando = false;
  File foto;

  final casoProvider = new CasosProviders();
  @override
  Widget build(BuildContext context) {
    final CasosModel casoProvider = ModalRoute.of(context).settings.arguments;
    if (casoProvider != null) {
      objCasos = casoProvider;
    }

    return new Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Denuncias'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearDenuncia(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearDenuncia() {
    return TextFormField(
      initialValue: objCasos.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Registre su Denuncia'),
      onSaved: (value) => objCasos.descripcion = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese Denuncia";
        } else {
          return null;
        }
        /*if(utils.isDenuncia(value)){
         return null;
       }else {
         return 'Ingrese Descripcion arriba de 3 caracters';
       }*/
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
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
    if(foto!=null){
      objCasos.fotoUrl = await  casoProvider.subirImagen(foto);
    }
    casoProvider.crearCasos(objCasos);

    setState(() {
      _guardando = false;
    });
    mostrarSnackbar('Registro Guardado');
    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldkey.currentState.showSnackBar(snackbar);
  }

  Widget _mostrarFoto() {
    if (objCasos.fotoUrl != null && objCasos.fotoUrl != '') {
      //tengo q hacdr esto
      return Container();
    } else {
      return Image(
          image: AssetImage(foto?.path ?? 'assets/no-image.png'),
          height: 300.0,
          fit: BoxFit.cover);
    }
  }

  _seleccionarFoto() async {
     _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async{
     foto = await ImagePicker.pickImage(source: origen);
    if (foto == null) {
      //limpiezxa
    }

    setState(() {});
  }
}
