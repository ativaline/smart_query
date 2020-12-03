import 'package:flutter/material.dart';
import 'package:smart_query/Componentes/ModaisAlerta.dart';
import 'package:smart_query/DataLocal/LoginStorage.dart';
import 'package:smart_query/Http/trocarSenhaHttp.dart';
import 'package:smart_query/Utils/enum.dart';
import 'package:smart_query/Views/smartQueryMailing.dart';

class TrocarSenhaService {
  final void Function() callbackSetState;
  final BuildContext context;

  TextEditingController senhaController = TextEditingController();
  TextEditingController novasenhaController = TextEditingController();
  TextEditingController repetirsenhacontroller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TrocarSenhaService(this.callbackSetState, this.context);

  Future<void> onPressedTrocarsenha() async {
    var usuarioRecuperado = await UsuarioStorage().retornarLogin();
    if (formKey.currentState.validate()) {
      if (novasenhaController.text == repetirsenhacontroller.text) {
        Interacoes.aguarde(context, imagenLoading: TipoSpinKit.circle);
        TrocarSenhahttp()
            .alterarsenha(usuarioRecuperado.login, senhaController.text,
                novasenhaController.text)
            .then((value) {
          Navigator.pop(context);
          if (value == "true") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Smartquerymailing();
            }));
            Interacoes.informacaoGenerica(context, "Senha alterada", "Ok");
          } else {
            Interacoes.informacaoGenerica(
                context,
                "Não foi possivel trocar a senha, procure o administrador",
                "Erro");
          }
        });
      } else {
        Interacoes.informacaoGenerica(context,
            "O campo nova senha e repetir senha devem ser iguais.", "Erro");
      }
    }
  }

  String validaSenha(value) {
    return value.isEmpty ? "Informe a senha" : null;
  }

  String validaNovaSenha(value) {
    return value.isEmpty ? "Informe a nova senha" : null;
  }

  String validaRepetirSenha(value) {
    return value.isEmpty ? "Repita a nova senha" : null;
  }
}
