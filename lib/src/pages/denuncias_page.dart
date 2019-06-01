import 'package:flutter/material.dart';
import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:nuevoproyecto/src/providers/casos_providers.dart';



class DenunciasPage extends StatefulWidget {
  @override
  _DenunciasPageState createState() => _DenunciasPageState();
}

class _DenunciasPageState extends State<DenunciasPage> {
  final formKey = GlobalKey<FormState>();
  CasosModel objCasos = new CasosModel();
  final casoProvider = new CasosProviders();
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(
      title: Text('Denuncias'),
      actions: <Widget>[
        IconButton(
          icon : Icon(Icons.photo_size_select_actual),
          onPressed: (){},
        ),
        
         IconButton(
          icon : Icon(Icons.camera_alt),
          onPressed: (){},
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
              _crearDenuncia(),
              
              _crearBoton()
            ],
          ),
        ),
      ),
    ),
 );
 }

 Widget _crearDenuncia(){
   return TextFormField(
     initialValue: objCasos.descripcion,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       labelText: 'Registre su Denuncia'
     ),
     onSaved: (value)=>objCasos.descripcion = value,
     validator: (value){
       if(value.length<3){
         return "Ingrese Denuncia";
       }else{
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

 Widget _crearBoton(){
   return RaisedButton.icon(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20.0)
     ),
     color: Colors.deepPurple,
     textColor: Colors.white,
     label: Text('Guardar'),
     icon:Icon(Icons.save),
     onPressed: _submit,
   );
 }

 void _submit(){
  if(!formKey.currentState.validate()){
    return;
   }
   formKey.currentState.save();
   print('Todo OK..');
   print(objCasos.descripcion);

   casoProvider.crearCasos(objCasos);

 }
}