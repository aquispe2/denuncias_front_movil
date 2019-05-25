import 'package:flutter/material.dart';
import 'package:nuevoproyecto/pages/form_denuncias.dart';
import 'package:nuevoproyecto/pages/denuncias.dart';


void main() {
  runApp(new MaterialApp(
   home: MyTabs(),
  ));
}


class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => new _MyTabsState();
 }


class _MyTabsState extends State<MyTabs>  with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      controller = new TabController(length: 2, vsync: this);
    }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Denuncia"),
       backgroundColor: Colors.green,
        
       bottom: new TabBar(
         tabs: <Widget>[
           new Tab(
             icon: new Icon(Icons.people),
             text: "Mis Denuncias",
           ),
          new Tab(
             icon: new Icon(Icons.ondemand_video),
            text: "Denunciar",
           ),
         ],
         controller: controller,
       ),
     ),
    body: new TabBarView(
      children: <Widget>[
         new Denuncias(), new FormDenuncias()
      ],
      controller: controller
    )
   );
  }
}