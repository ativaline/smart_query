import 'package:flutter/material.dart';
import 'package:smart_query/Views/Login.dart';
import 'package:smart_query/Views/lista.dart';
import 'package:smart_query/Views/smartQueryMailing.dart';
import 'package:smart_query/Views/trocarSenha.dart';
import 'Temas.dart';

class DrawerPadrao extends StatelessWidget {
  final PageController pageController;

  DrawerPadrao(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Temas.azulPadrao,
            height: 60,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.only(top: 20, left: 50),
                child: Text(
                  "Smartquery Menu",
                  style: TextStyle(
                      fontSize: 25,
                      color: Temas.branco,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Divider(),
          DrawerLinha(
              Icons.app_registration, "Gerar Mailing", Smartquerymailing()),
          DrawerLinha(Icons.assignment, "Exibir Resultados", ListaMailing()),
          DrawerLinha(Icons.vpn_key, "Trocar a Senha", TrocarSenha()),
          DrawerLinha(Icons.exit_to_app_outlined, "Sair", Login()),
        ],
      ),
    );
  }
}

class DrawerLinha extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final Widget tela;
  DrawerLinha(this.icone, this.titulo, this.tela);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => tela));
        },
        child: Container(
          height: 60.0,
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(
                icone,
                size: 32,
                color: //_pageController.page.round() == page
                    //? Temas.azulPadrao
                    Temas.cinza,
              ),
              SizedBox(
                width: 32,
              ),
              Text(
                titulo,
                style: TextStyle(
                    fontSize: 16,
                    color: //_pageController.page.round() == page
                        //? Temas.azulPadrao
                        Temas.cinza),
              )
            ],
          ),
        ),
      ),
    );
  }
}
