import 'package:flutter/material.dart';
import 'package:smart_query/Componentes/ModaisAlerta.dart';
import 'package:smart_query/DataLocal/LoginStorage.dart';
import 'package:smart_query/Http/smartQueryHttp.dart';
import 'package:smart_query/Modelo/smartQueryMotor.dart';
import 'package:smart_query/Utils/enum.dart';

class SmartQueryServices {
  final void Function() callbackSetState;
  final BuildContext context;

  SmartQueryServices(this.context, this.callbackSetState);

  SelectType convenioController;
  SelectType produtoController;
  SelectType meioPagtoController;
  SelectType uFController;
  SelectType uFBeneficioController;
  TextEditingController idadeDeController = TextEditingController();
  TextEditingController idadeAteController = TextEditingController();
  TextEditingController salarioDeController = TextEditingController();
  TextEditingController salarioAteController = TextEditingController();
  List<SelectType> listaProduto = List<SelectType>();
  List<SelectType> listaConvenio = List<SelectType>();
  List<SelectType> listaMeioPagto = List<SelectType>();
  List<SelectType> listaUF = List<SelectType>();

  Future<void> onPressedMotor() async {
    var usuarioRecuperado = await UsuarioStorage().retornarLogin();
    if (convenioController == null || produtoController == null) {
      Interacoes.informacaoGenerica(context,
          "Convenio e Produto são de preenchimento obrigatório!", "Erro");
      return;
    }
    SmartqueryMotor model = new SmartqueryMotor(
      convenio: convenioController.id,
      produto: produtoController.id,
      meioPagamento: meioPagtoController == null
          ? null
          : <String>[meioPagtoController.id.toString()],
      ufEndereco: uFController == null ? null : <String>[uFController.name],
      ufBeneficio: uFBeneficioController == null
          ? null
          : <String>[uFBeneficioController.name],
      idUsuario: usuarioRecuperado.idUsuario,
      loja: int.tryParse(usuarioRecuperado.lojaUsuario),
      idadeDe: idadeDeController.text,
      idadeAte: idadeAteController.text,
      salarioDe: salarioDeController.text,
      salarioAte: salarioAteController.text,
    );
    Interacoes.aguarde(context, imagenLoading: TipoSpinKit.circle);
    SmartQueryHTTP().salvaMotor(model).then((value) async {
      Navigator.pop(context);
      if (value == "true") {
        Interacoes.informacaoGenerica(
            context, "Smarquery registrado com sucesso! ", "Ok");
        resetaCampos();
      } else {
        Interacoes.informacaoGenerica(
            context,
            usuarioRecuperado.mensagem == null
                ? "Erro ao registrar o smartquery!"
                : usuarioRecuperado.mensagem,
            "Erro");
      }
    });
  }

  void listProdutos() {
    listaProduto.add(SelectType(id: 1, name: "Cartão"));
    listaProduto.add(SelectType(id: 2, name: "Emprestimo Consignado"));
    listaProduto.add(SelectType(id: 3, name: "Refinanciamento"));
    listaProduto.add(SelectType(id: 4, name: "Portabilidade"));
  }

  void listConvenio() {
    listaConvenio.add(SelectType(id: 1581, name: "INSS"));
    listaConvenio.add(SelectType(id: 164, name: "Federal"));
  }

  void listMeioPagamento() {
    listaMeioPagto.add(SelectType(id: 1, name: "01:CARTAO MAGNETICO"));
    listaMeioPagto.add(SelectType(id: 2, name: "02:CONTA-CORRE FITA MA"));
    listaMeioPagto.add(SelectType(id: 3, name: "03:CONTA-CORRE LISTAGEM"));
    listaMeioPagto.add(SelectType(id: 4, name: "04:PAGTO ALTERNATIVO BEN"));
    listaMeioPagto.add(SelectType(id: 5, name: "05:AUTORIZACAO PAGTO BEN"));
    listaMeioPagto.add(SelectType(id: 6, name: "06:CHEQUE DE PAGTO BENEF"));
    listaMeioPagto.add(SelectType(id: 7, name: "07:ORDEM DE PAGTO BENEFI"));
    listaMeioPagto.add(SelectType(id: 8, name: "08:RELACAO DE PAGTO BENE"));
    listaMeioPagto.add(SelectType(id: 9, name: "09:AUTORIZACAO DE PAGAME"));
  }

  void listUf() {
    listaUF.add(SelectType(id: 1, name: 'AC'));
    listaUF.add(SelectType(id: 1, name: 'AL'));
    listaUF.add(SelectType(id: 1, name: 'AP'));
    listaUF.add(SelectType(id: 1, name: 'AM'));
    listaUF.add(SelectType(id: 1, name: 'BA'));
    listaUF.add(SelectType(id: 1, name: 'CE'));
    listaUF.add(SelectType(id: 1, name: 'DF'));
    listaUF.add(SelectType(id: 1, name: 'ES'));
    listaUF.add(SelectType(id: 1, name: 'GO'));
    listaUF.add(SelectType(id: 1, name: 'MA'));
    listaUF.add(SelectType(id: 1, name: 'MT'));
    listaUF.add(SelectType(id: 1, name: 'MS'));
    listaUF.add(SelectType(id: 1, name: 'MG'));
    listaUF.add(SelectType(id: 1, name: 'PA'));
    listaUF.add(SelectType(id: 1, name: 'PB'));
    listaUF.add(SelectType(id: 1, name: 'PR'));
    listaUF.add(SelectType(id: 1, name: 'PE'));
    listaUF.add(SelectType(id: 1, name: 'PI'));
    listaUF.add(SelectType(id: 1, name: 'RJ'));
    listaUF.add(SelectType(id: 1, name: 'RN'));
    listaUF.add(SelectType(id: 1, name: 'RS'));
    listaUF.add(SelectType(id: 1, name: 'RO'));
    listaUF.add(SelectType(id: 1, name: 'RR'));
    listaUF.add(SelectType(id: 1, name: 'SC'));
    listaUF.add(SelectType(id: 1, name: 'SP'));
    listaUF.add(SelectType(id: 1, name: 'SE'));
    listaUF.add(SelectType(id: 1, name: 'TO'));
  }

  void resetaCampos() {
    convenioController = null;
    produtoController = null;
    idadeDeController.text = "";
    idadeAteController.text = "";
    salarioDeController.text = "";
    salarioAteController.text = "";
    uFBeneficioController = null;
    uFController = null;
    meioPagtoController = null;

    callbackSetState();
  }
}

class SelectType {
  int id;
  String name;

  SelectType({this.id, this.name});
}
