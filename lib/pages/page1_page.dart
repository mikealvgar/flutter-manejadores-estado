import 'package:counter_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(snapshot.data)
              : const Center(child: Text('No hay información del usuario'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;

  const InformacionUsuario(this.usuario);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),

          ListTile(title: Text('Nombre: ${usuario!.nombre}')),
          ListTile(title: Text('Edad: ${usuario!.edad}')),
          
          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(title: Text('Profesion 1: ')),
          ListTile(title: Text('Profesion 1: ')),
          ListTile(title: Text('Profesion 1: ')),
        ],
      ),
    );
  }
}