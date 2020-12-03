import 'package:flutter/material.dart';
import 'package:smart_query/Modelo/listaMotor.dart';
import 'package:smart_query/Services.dart/listaSmartQueryService.dart';
import 'package:smart_query/Utils/Temas.dart';

class ListaMailing extends StatefulWidget {
  @override
  _ListaMailingState createState() => _ListaMailingState();
}

class _ListaMailingState extends State<ListaMailing> {
  ListaSmartqueryService _service;

  void callbackSetState() => setState(() {});

  @override
  void initState() {
    _service = ListaSmartqueryService(callbackSetState, context);
    _service.retornaListaSmartquery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Lista de Mailing"),
        centerTitle: true,
      ),
      body: !_service.listacarregada
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _service.listaMotor.length,
              itemBuilder: (_, index) {
                var item = _service.listaMotor[index];
                return CardLista(item: item);
              },
            ),
    );
  }
}

class CardLista extends StatelessWidget {
  final Lista item;
  const CardLista({this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Text('Nome:'),
                  SizedBox(width: 10),
                  FittedBox(
                      child: Text(
                    item.nomeArquivo,
                    style: TextStyle(fontSize: 12),
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Processamento:'),
                SizedBox(width: 10),
                Text(item.idArquivo.toString())
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Status:'),
                SizedBox(width: 10),
                Text(
                  item.status > 2
                      ? "Finalizado"
                      : item.status == 0
                          ? "Aguardando"
                          : "Processando",
                  style: TextStyle(
                      color: item.status > 2 ? Colors.green : Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Link:'),
                SizedBox(width: 10),
                Text(
                  item.ipExecucao,
                  style: TextStyle(color: Temas.azulPadrao),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
