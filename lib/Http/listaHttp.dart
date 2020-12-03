import 'baseHttp.dart';

class Listahttp extends BaseHttp {
  Future<String> retornaLista(int id) async {
    var response = await requestGet("Motor?Id=$id", true);
    if (response.body != null) {
      return response.body;
    } else {
      return null;
    }
  }
}
