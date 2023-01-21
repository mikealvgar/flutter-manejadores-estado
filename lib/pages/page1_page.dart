import 'package:counter_app/bloc/usuario/usuario_cubit.dart';
import 'package:counter_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              context.read<UsuarioCubit>().borrarUsuario();
            }, 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
        title: const Text('Pagina 1'),
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {

        switch(state.runtimeType) {
          
          case UsuarioInit:
            return const Center(child: Text('No hay información del usuario'));
          break;

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          break;
          
          default:
            return const Center(
            child: Text('Estado no reconocible'),
          );

        }
       /*  if( state is UsuarioInit ){
          return const Center(child: Text('No hay información del usuario'));
        } else if(state is UsuarioActivo) {
          return InformacionUsuario(state.usuario);
        }else {
          return const Center(
            child: Text('Estado no reconocible'),
          );
        } */
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

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
          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
          const Divider(),

          ListTile(title: Text('Nombre: ${usuario.nombre} ')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          
          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
          const Divider(),
          
          ...?usuario.profesiones?.map(
            (profesion) => ListTile(title: Text('Profesion 1: $profesion'))).toList(),

        ],
      ),
    );
  }
}