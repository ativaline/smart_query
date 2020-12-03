import 'package:flutter/material.dart';
import 'package:smart_query/Services.dart/trocarSenhaService.dart';

class TrocarSenha extends StatefulWidget {
  @override
  _TrocarSenhaState createState() => _TrocarSenhaState();
}

class _TrocarSenhaState extends State<TrocarSenha> {
  TrocarSenhaService _service;

  void callbackSetState() {
    setState(() {});
  }

  @override
  void initState() {
    _service = TrocarSenhaService(callbackSetState, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Trocar Senha"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20, left: 30),
          child: Form(
            key: _service.formKey,
            child: Column(
              children: [
                LinhaImputText("Senha atual", 21, _service.senhaController,
                    _service.validaSenha),
                LinhaImputText("Nova senha", 21, _service.novasenhaController,
                    _service.validaNovaSenha),
                LinhaImputText(
                    "Repetir senha",
                    10,
                    _service.repetirsenhacontroller,
                    _service.validaRepetirSenha),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _service.onPressedTrocarsenha,
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class LinhaImputText extends StatelessWidget {
  final String label;
  final double distancia;
  final TextEditingController controller;
  final validator;

  const LinhaImputText(
      this.label, this.distancia, this.controller, this.validator);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(top: 60)),
        Text("$label:"),
        SizedBox(width: distancia),
        Container(
          height: 40,
          width: 200,
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: controller,
            validator: validator,
            decoration: new InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
