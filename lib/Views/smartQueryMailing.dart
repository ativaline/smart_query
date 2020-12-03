import 'package:flutter/material.dart';
import 'package:smart_query/Services.dart/smartQueryService.dart';
import 'package:smart_query/Utils/Temas.dart';
import 'package:smart_query/Utils/drawerPadrao.dart';

class Smartquerymailing extends StatefulWidget {
  @override
  _SmartquerymailingState createState() => _SmartquerymailingState();
}

class _SmartquerymailingState extends State<Smartquerymailing> {
  SmartQueryServices _service;
  final pageController = PageController();
  var visivel = true;

  void callbackSetState() {
    setState(() {});
  }

  @override
  void initState() {
    _service = SmartQueryServices(context, callbackSetState);
    _service.listConvenio();
    _service.listProdutos();
    _service.listMeioPagamento();
    _service.listUf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        (Scaffold(
            drawer: DrawerPadrao(pageController),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Smart Query Mailing"),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Form(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 30),
                child: Column(children: [
                  LinhaDropdown(
                      itemSelecionado: _service.convenioController,
                      lista: _service.listaConvenio,
                      callBack: (value) {
                        _service.convenioController = value;
                        _service.callbackSetState();
                      },
                      label: 'Convênio:'),
                  LinhaDropdown(
                      itemSelecionado: _service.produtoController,
                      lista: _service.listaProduto,
                      callBack: (value) {
                        _service.produtoController = value;
                        _service.callbackSetState();
                      },
                      label: 'Produto:'),
                  LinhaImputText("Idade:", _service.idadeDeController,
                      _service.idadeAteController),
                  LinhaImputText("Salário:", _service.salarioDeController,
                      _service.salarioAteController),
                  Visibility(
                      visible: visivel,
                      child: Column(
                        children: [
                          LinhaDropdown(
                              itemSelecionado: _service.meioPagtoController,
                              lista: _service.listaMeioPagto,
                              callBack: (value) {
                                _service.meioPagtoController = value;
                                _service.callbackSetState();
                              },
                              label: 'Meio Pagto:'),
                          LinhaDropdown(
                              itemSelecionado: _service.uFController,
                              lista: _service.listaUF,
                              callBack: (value) {
                                _service.uFController = value;
                                _service.callbackSetState();
                              },
                              label: 'UF Endereço:'),
                          LinhaDropdown(
                              itemSelecionado: _service.uFBeneficioController,
                              lista: _service.listaUF,
                              callBack: (value) {
                                _service.uFBeneficioController = value;
                                _service.callbackSetState();
                              },
                              label: 'UF Beneficio:')
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: _service.onPressedMotor,
                      child: Text(
                        "Processar",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.blue,
                    ),
                  )
                ]),
              ),
            ))))
      ],
    );
  }
}

class LinhaImputText extends StatelessWidget {
  final String label;
  final TextEditingController controller1;
  final TextEditingController controller2;

  LinhaImputText(this.label, this.controller1, this.controller2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(top: 50)),
        Text(label),
        SizedBox(width: label == "Idade:" ? 32 : 24),
        Container(
          height: 40,
          width: 70,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller1,
            decoration: new InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 0.0),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Text("a:"),
        SizedBox(width: 10),
        Container(
          height: 40,
          width: 70,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller2,
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

class DropDownPadrao extends StatelessWidget {
  DropDownPadrao({
    Key key,
    @required this.itemSelecionado,
    @required this.lista,
    @required this.callBack,
  }) : super(key: key);

  final SelectType itemSelecionado;
  final List<SelectType> lista;
  final void Function(SelectType value) callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<SelectType>(
        value: itemSelecionado,
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Temas.azulPadrao, fontSize: 13),
        underline: Container(
          height: 2,
          color: Temas.azulPadrao,
        ),
        onChanged: (SelectType value) {
          callBack(value);
        },
        items: lista.map((SelectType user) {
          return DropdownMenuItem<SelectType>(
            value: user,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LinhaDropdown extends StatelessWidget {
  LinhaDropdown(
      {Key key,
      @required this.itemSelecionado,
      @required this.lista,
      @required this.callBack,
      @required this.label})
      : super(key: key);

  final SelectType itemSelecionado;
  final List<SelectType> lista;
  final String label;
  final void Function(SelectType value) callBack;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(label),
      ),
      SizedBox(width: 15),
      Container(
          child: DropDownPadrao(
              itemSelecionado: itemSelecionado,
              lista: lista,
              callBack: callBack))
    ]);
  }
}
