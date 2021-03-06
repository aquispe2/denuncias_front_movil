import 'package:flutter/material.dart';
import 'package:nuevoproyecto/src/bloc/provider.dart';
import 'package:nuevoproyecto/src/pages/denuncias_page.dart';
import 'package:nuevoproyecto/src/pages/home_page.dart';
import 'package:nuevoproyecto/src/pages/login_page.dart';
import 'package:nuevoproyecto/src/pages/usuario_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return  Provider(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material',
    initialRoute: 'login',
    routes: {
      'login':(BuildContext context )=> LoginPage(),
      'home':(BuildContext context )=> HomePage(),
      'denuncias':(BuildContext context )=> DenunciasPage(),
      'usuario_nuevo':(BuildContext context )=> UsuarioNuevoPage()
    },
    theme: ThemeData(primaryColor: Colors.deepPurple),
    )
  );
 }
}