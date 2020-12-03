import 'dart:convert';

import 'package:smart_query/Modelo/Usuario.dart';
import 'package:smart_query/Utils/Constants.dart';

import 'baselocal.dart';

class UsuarioStorage extends BaseLocalStorage {
  @override
  Future<bool> salvar(String id, String json) {
    return super.salvar(id, json);
  }

  Future<LoginModelo> retornarLogin() async {
    String jsonEntidade = await ler(Constantes.idLoginUsuario);
    if (jsonEntidade != null) {
      var entidadeRecuprada = LoginModelo.fromJson(json.decode(jsonEntidade));
      return entidadeRecuprada;
    } else {
      return null;
    }
  }

  Future<bool> excluirLogin() async {
    return super.excluir(Constantes.idLoginUsuario);
  }
}
