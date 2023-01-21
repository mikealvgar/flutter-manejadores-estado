

import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioServices with ChangeNotifier{

  Usuario? _usuario;

  Usuario? get usuario => _usuario; 
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario( Usuario? user ) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad( int edad ) {
    _usuario?.edad = edad;
  }

  void removeUsuario(){
    _usuario = null;
  }

}