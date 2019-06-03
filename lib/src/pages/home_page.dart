import 'package:flutter/material.dart';
import 'package:nuevoproyecto/src/bloc/provider.dart';
import 'package:nuevoproyecto/src/models/casos_model.dart';
import 'package:nuevoproyecto/src/providers/casos_providers.dart';

class HomePage extends StatelessWidget {
  final casosProvider = new CasosProviders();

  @override
  Widget build(BuildContext context) {

   
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Denuncias')),
      body: _crearListadoCasos(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListadoCasos() {
    return FutureBuilder(
      future: casosProvider.cargarCasos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CasosModel>> snapshot) {
        if (snapshot.hasData) {
          final casos = snapshot.data;
          return ListView.builder(
              itemCount: casos.length,
              itemBuilder: (context, i) => _crearItem(casos[i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(CasosModel caso) {
    return Dismissible(
      key:UniqueKey(),
      background: Container(color: Colors.red,),
          child: ListTile(
        title: Text('${caso.descripcion} - ${caso.casoId}'),
        subtitle: Text('sdsdsd'),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () => Navigator.pushNamed(context, 'denuncias'));
  }
}
