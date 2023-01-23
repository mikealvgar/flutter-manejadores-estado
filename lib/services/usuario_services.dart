

import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioServices with ChangeNotifier{

  Usuario? _usuario;

  Usuario? get usuario => _usuario; 
  bool get existeUsuario => (_usuario != null) ? true : false;

  get usuarioStream => null;

  set usuario( Usuario? user ) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad( int edad ) {
    _usuario?.edad = edad;
    notifyListeners();
  }

  void removeUsuario(){
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(){
    _usuario?.profesiones?.add('Profesion: ${_usuario!.profesiones!.length + 1}');
    notifyListeners();
  }

}