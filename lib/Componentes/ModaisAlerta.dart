import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_query/Utils/Temas.dart';
import 'package:smart_query/Utils/Tradutores.dart';
import 'package:smart_query/Utils/enum.dart';

class Interacoes {
  static Future<DateTime> calendario(
      BuildContext context, DateTime date) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        helpText: "Selecione uma Data");

    if (picked != null && picked != date) {
      return picked;
    }

    return date;
  }

  static aguarde(BuildContext context,
      {String label = "aguarde...",
      TipoSpinKit imagenLoading = TipoSpinKit.threeBounce}) {
    Widget spinKit = Tradutores.definirSpinKit(imagenLoading, 35);

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              actionsPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Container(child: Processando(label, spinKit: spinKit)));
        });
  }

  static void perguntaGenericaComResposta(
      BuildContext context, String pergunta, String titulo, Function callback) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Text(
                titulo,
                style: TextStyle(color: Temas.branco),
              ),
              color: Temas.azulPadrao,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.question,
                      size: 50,
                      color: Colors.blue.withOpacity(.8),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            pergunta,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  callback(false);
                },
              ),
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  callback(true);
                },
              )
            ],
          );
        });
  }

  static void informacaoGenerica(
      BuildContext context, String informacao, String titulo,
      {barrierDismissible = false}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Text(
                titulo,
                style: TextStyle(color: Temas.branco),
              ),
              color: Temas.azulPadrao,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Icon(
                    //   FontAwesomeIcons.info,
                    //   size: 50,
                    //   color: Colors.blue.withOpacity(.50),
                    // ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: Center(
                          child: Container(
                            child: Text(
                              informacao,
                              style: TextStyle(
                                color: Temas.azulPadrao,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  static void showSnackBar(
      GlobalKey<ScaffoldState> scaffoldKey, String mensagem,
      {String label,
      Function callBack,
      Duration duration = const Duration(milliseconds: 1000)}) {
    var snackBar = SnackBar(
      duration: duration,
      content: Text(mensagem),
      action: SnackBarAction(
        label: label ?? "Fechar",
        onPressed: callBack ?? () {},
      ),
    );
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // static void logarMensagem(String mensagem) {
  //   if (VariavesSistema.ambiente == TipoAmbiente.dev) {
  //     log(mensagem);
  //   }
  // }
}

class Processando extends StatelessWidget {
  final String _label;
  final Widget spinKit;

  Processando(
    this._label, {
    Key key,
    this.spinKit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Temas.branco,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border:
                    Border.all(width: 0.5, color: Temas.azulPadrao.shade100)),
            width: 220,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Container(height: 35, child: spinKit),
                SizedBox(
                  height: 15,
                ),
                Text(
                  _label,
                  style: TextStyle(
                      color: Temas.azulPadrao,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}
