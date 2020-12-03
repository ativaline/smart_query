import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_query/DataLocal/LoginStorage.dart';
import 'package:smart_query/Http/listaHttp.dart';
import 'package:smart_query/Modelo/listaMotor.dart';

class ListaSmartqueryService {
  final void Function() callbackSetState;
  final BuildContext context;
  var listacarregada = false;
  ListaSmartqueryService(this.callbackSetState, this.context);

  List<Lista> listaMotor = List<Lista>();

  Future<void> retornaListaSmartquery() async {
    var usuarioLogado = await UsuarioStorage().retornarLogin();
    Listahttp().retornaLista(usuarioLogado.idUsuario).then((value) async {
      var entidadeRecuprada = ListaMotor.fromJson(json.decode(value));
      listaMotor = entidadeRecuprada.lista;
      listacarregada = true;
      callbackSetState();
    });
  }
}
