import 'package:flutter/material.dart';
import 'package:smart_query/Componentes/ModaisAlerta.dart';
import 'package:smart_query/Http/novaSenhaHttp.dart';
import 'package:smart_query/Utils/enum.dart';
import 'package:smart_query/Views/Login.dart';

class NovaSenhaService {
  final void Function() callbackSetState;
  final BuildContext context;

  TextEditingController loginController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  NovaSenhaService(this.callbackSetState, this.context);

  Future<void> onPressedNovaSenha() async {
    Interacoes.aguarde(context, imagenLoading: TipoSpinKit.circle);
    NovaSenhahttp().novasenha(loginController.text).then((value) {
      Navigator.pop(context);
      if (value == "true") {
        Interacoes.informacaoGenerica(
            context, "Nova senha enviada para o e-mail cadastrado! ", "Ok");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Login();
        }));
      } else {
        Interacoes.informacaoGenerica(context,
            "Não foi possivel trocar a senha, procure o administrador", "Erro");
      }
    });
  }
}
