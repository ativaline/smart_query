import 'package:flutter/material.dart';
import 'package:smart_query/Componentes/ModaisAlerta.dart';
import 'package:smart_query/DataLocal/LoginStorage.dart';
import 'package:smart_query/Http/loginHttp.dart';
import 'package:smart_query/Utils/Constants.dart';
import 'package:smart_query/Utils/enum.dart';
import 'package:smart_query/Views/esqueciSenha.dart';
import 'package:smart_query/Views/smartQueryMailing.dart';

class LoginServices {
  final void Function() callbackSetState;
  final BuildContext context;

  LoginServices(this.context, this.callbackSetState);

  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> onPressedLogin() async {
    if (formKey.currentState.validate()) {
      await UsuarioStorage().excluirLogin();
      Interacoes.aguarde(context, imagenLoading: TipoSpinKit.circle);
      LoginHTTP()
          .login(usuarioController.text, senhaController.text,
              "SmartqueryMailinApp")
          .then((value) async {
        await UsuarioStorage().salvar(Constantes.idLoginUsuario, value);
        var usuarioRecuperado = await UsuarioStorage().retornarLogin();
        Navigator.pop(context);
        if (usuarioRecuperado.logado) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Smartquerymailing();
          }));
        } else {
          Interacoes.informacaoGenerica(
              context,
              usuarioRecuperado.mensagem == null
                  ? "Erro ao tentar logar no sistema!"
                  : usuarioRecuperado.mensagem,
              "Erro");
        }
      });
    }
  }

  String validatorSenha(value) {
    return value.isEmpty ? "Informe a senha" : null;
  }

  String validatorUsuario(value) {
    return value.isEmpty ? "Informe o nome" : null;
  }

  void onTapEsqueciSenha() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EsqueciSenha();
    }));
  }
}
