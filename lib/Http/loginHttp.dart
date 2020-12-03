import 'baseHttp.dart';

class LoginHTTP extends BaseHttp {
  Future<String> obterlogin(Usuario usuario) async {
    var response = await requestPost("login", usuario);
    if (validarResponse(response)) {
      return response.body;
    }
    return null;
  }

  Future<String> login(String login, String pwd, String imei) async {
    var response = await requestGet("login?login=$login&senha=$pwd&imei=$imei");
    if (validarResponse(response)) {
      return response.body;
    }
    return null;
  }
}

class Usuario {
  String login;
  String senha;
}
