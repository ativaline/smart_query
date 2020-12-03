import 'baseHttp.dart';

class TrocarSenhahttp extends BaseHttp {
  Future<String> alterarsenha(
      String login, String senha, String novasenha) async {
    var response = await requestGet(
        "alterarsenha?login=$login&senha=$senha&novasenha=$novasenha");
    if (validarResponse(response)) {
      return response.body;
    }
    return null;
  }
}
