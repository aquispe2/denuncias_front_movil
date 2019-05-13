import 'package:flutter/material.dart';
import 'package:nuevoproyecto/common/HttpHandler.dart';
import 'package:nuevoproyecto/model/Casos.dart';
import 'package:nuevoproyecto/caso_list_item.dart';

class Denuncias extends StatefulWidget {
  @override
  _DenunciasState createState() => new _DenunciasState();
 }
class _DenunciasState extends State<Denuncias> {

List<Casos> _casos = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCasos();
  }
  


  void loadCasos() async{
    var casos = await HttpHandler().fetchCasos();
    setState(() {
      _casos.addAll(casos);
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
   return new Container(
     child: new ListView.builder(
       itemCount: _casos.length,
       itemBuilder: (BuildContext context, int index){
         return new CasosListItem(_casos[index]);
       }
     ),
   );
  }
}