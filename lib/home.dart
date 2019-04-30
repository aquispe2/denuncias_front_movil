import 'package:flutter/material.dart';
import 'package:nuevoproyecto/common/HttpHandler.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJson();
  }

  _loadJson() async{
    String data = await HttpHandler().fetchCasos();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Registrar Denuncia"),
       actions: <Widget>[
         new IconButton(
           icon:new Icon(Icons.search,color:Colors.white),
           onPressed: (){},
         )
       ],
     ),
     drawer: new Drawer(
       child:new ListView(
         children: <Widget>[
            new DrawerHeader(child:new Material()),
            new ListTile(
              title: new Text("Denuncias"),
              trailing: new Icon(Icons.data_usage),
            ),
            new ListTile(
              title: new Text("Perfil"),
              trailing: new Icon(Icons.data_usage),
            ),
            new ListTile(
              title: new Text("Salir"),
              trailing: new Icon(Icons.close),
              onLongPress: ()=> Navigator.of(context).pop(),
            ),
         ],
       )
     ),

     bottomNavigationBar: new BottomNavigationBar(
       items: _getFooterItems(),
     ),
   );
  }
  List<BottomNavigationBarItem>  _getFooterItems(){
      return [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.thumb_down),
          title: new Text("Realizar Denuncia")
        ),
         new BottomNavigationBarItem(
          icon: new Icon(Icons.thumb_down),
          title: new Text("Mis Denuncias")
        )
      ];
    }
}