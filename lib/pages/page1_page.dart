import 'package:flutter/material.dart';
import 'package:counter_app/services/usuario_services.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioServices>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: usuarioService.existeUsuario
      ? InformacionUsuario(usuario: usuarioService.usuario!)
      : const Center( child: Text('No hay usuario seleccionado'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({required this.usuario});
  
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

          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          
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