import 'package:flutter/material.dart';
import 'package:smart_query/Services.dart/novaSenhaService.dart';

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  NovaSenhaService _service;

  void callbackSetState() {
    setState(() {});
  }

  @override
  void initState() {
    _service = NovaSenhaService(callbackSetState, context);
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
          child: Column(
            children: [
              LinhaImputText("Login", 21, _service.loginController),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 50.0,
                child: RaisedButton(
                  onPressed: _service.onPressedNovaSenha,
                  child: Text(
                    "Enviar",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}

class LinhaImputText extends StatelessWidget {
  final String label;
  final double distancia;
  final TextEditingController controller;

  const LinhaImputText(this.label, this.distancia, this.controller);
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
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            controller: controller,
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
