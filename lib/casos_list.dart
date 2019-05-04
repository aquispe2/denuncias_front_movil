import 'package:flutter/material.dart';
import 'package:nuevoproyecto/common/HttpHandler.dart';
import 'package:nuevoproyecto/model/Casos.dart';
import 'package:nuevoproyecto/caso_list_item.dart';

class CasosList extends StatefulWidget {
  @override
  _CasosListState createState() => new _CasosListState();
 }
class _CasosListState extends State<CasosList> {

List<Casos> _casos = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCasos();
  }

  void loadCasos() async{
    
    var casos = await HttpHandler().fetchCasos();
    
    //print(casos.toString());
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