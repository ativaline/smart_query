import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_query/Componentes/ImputTextPadrao.dart';
import 'package:smart_query/Services.dart/LoginService.dart';
import 'package:smart_query/Utils/Temas.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginServices _service;

  void callbackSetState() {
    setState(() {});
  }

  @override
  void initState() {
    _service = LoginServices(context, callbackSetState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Temas.branco,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 120, 30, 30),
          child: Form(
            key: _service.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(FontAwesomeIcons.user,
                    size: 120.0, color: Temas.azulPadrao),
                ImputTextPadrao(
                    label: "Usuário",
                    controller: _service.usuarioController,
                    validator: _service.validatorUsuario),
                ImputTextPadrao(
                  label: "Senha",
                  controller: _service.senhaController,
                  validator: _service.validatorSenha,
                  obscureText: true,
                ),
                ContainerDoBotao(service: _service),
                LinkEsqueciSenha(service: _service)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinkEsqueciSenha extends StatelessWidget {
  const LinkEsqueciSenha({
    Key key,
    @required LoginServices service,
  })  : _service = service,
        super(key: key);

  final LoginServices _service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: _service.onTapEsqueciSenha,
        child: Text(
          "Esqueci minha senha",
          textAlign: TextAlign.center,
          style: TextStyle(color: Temas.azulPadrao, fontSize: 15.0),
        ),
      ),
    );
  }
}

class ContainerDoBotao extends StatelessWidget {
  const ContainerDoBotao({
    Key key,
    @required LoginServices service,
  })  : _service = service,
        super(key: key);

  final LoginServices _service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 50.0,
      child: RaisedButton(
        onPressed: _service.onPressedLogin,
        child: Text(
          "Entrar",
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        color: Colors.blue,
      ),
    );
  }
}
