import 'baseHttp.dart';

class NovaSenhahttp extends BaseHttp {
  Future<String> novasenha(String login) async {
    var response = await requestGet("novasenha?login=$login");
    if (validarResponse(response)) {
      return response.body;
    }
    return null;
  }
}
