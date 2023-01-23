import 'package:counter_app/models/usuario.dart';
import 'package:counter_app/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});
  
  @override
  Widget build(BuildContext context) {

    final usuarioServices = Provider.of<UsuarioServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioServices.existeUsuario ? Text('${usuarioServices.usuario?.nombre}') : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                
                final newUser = Usuario(nombre: 'Miguel Alvarez', edad: 24, profesiones: ['FullStack Developer', 'Gamer Player Expert']);
                usuarioServices.usuario = newUser;

              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white),),
            ),
            
            MaterialButton(
              color: Colors.blue,
              onPressed: (){

                usuarioServices.cambiarEdad(30);

              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white),),
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuarioServices.agregarProfesion();
              },
              child: const Text('Añadir Profesión', style: TextStyle( color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}