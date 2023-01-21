
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{

  UsuarioCubit() : super(UsuarioInit());

  void seleccionarUsuario(Usuario usuario) {

    emit(UsuarioActivo(usuario));

  }

  void cambiarEdad(int edad) {

    final currentState = state;
    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
    
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newProfesiones = [
        ...?currentState.usuario.profesiones,
        'Prefesion: ${currentState.usuario.profesiones!.length + 1}'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInit());
  }
  
}