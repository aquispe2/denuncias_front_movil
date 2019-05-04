import 'package:flutter/material.dart';
import 'package:nuevoproyecto/model/Casos.dart';
class CasosListItem extends StatelessWidget {
  final Casos casos ;
  CasosListItem(this.casos);


 @override
 Widget build(BuildContext context) {
  return new ListTile(
    leading: new CircleAvatar(child: new Text(casos.caso_id.toString())), 
    title: new Text("CASO: "+casos.usuario_id.toString()),
    subtitle: new Text(casos.descripcion.toString()),
  );
 }
}