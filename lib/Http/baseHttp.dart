import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

abstract class BaseHttp {
  final Duration _timeOut =
      Duration(seconds: 60); //VariavesSistema.timeOutApiRepeLub;
  final String autenticacaoUrl =
      'http://hconsignadoamigo.consignadoamigo.com.br/api/'; //VariavesSistema.urlApiRepeLub;
  final String smartqueryUrl = 'http://sl.ativaline.com.br:5100/api/';

  String _urlCompleta(String urlComplementar, [bool api = false]) {
    String urlCompleta;
    if (api) {
      urlCompleta = "$smartqueryUrl$urlComplementar";
    } else {
      urlCompleta = "$autenticacaoUrl$urlComplementar";
    }
    return urlCompleta;
  }

  void _logarUrl(String url, String metodo, bool authorize) {
    log(">>> $metodo - $url - token $authorize");
  }

  Future<http.Response> requestGet(String url, [bool api = false]) async {
    try {
      String urlCompleta = _urlCompleta(url, api);
      _logarUrl(urlCompleta, "get", false);
      http.Response response = await http.get(
        urlCompleta,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(_timeOut);

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<http.Response> requestPost(String urlComplementar, Object body) async {
    String urlcompleta = _urlCompleta(urlComplementar, true);
    _logarUrl(urlcompleta, "post", false);
    var bodyString = json.encode(body);
    http.Response response = await http
        .post(urlcompleta,
            headers: {"Content-Type": "application/json"}, body: bodyString)
        .timeout(_timeOut);
    return response;
  }

  Future<http.Response> requestPostAuthorize(
      String urlComplementar, Object body) async {
    // var usuarioLogado = await VariavesSistema.getLoginUsuarioLogado;
    // var token = usuarioLogado.accessToken;
    var token = "";
    String urlcompleta = _urlCompleta(urlComplementar);
    _logarUrl(urlcompleta, "post", false);
    var bodyString = json.encode(body);
    http.Response response = await http
        .post(urlcompleta,
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: bodyString)
        .timeout(_timeOut);
    return response;
  }

  Future<http.Response> requestGetAuthorize(
    String url,
  ) async {
    try {
      // var usuarioLogado = await VariavesSistema.getLoginUsuarioLogado;
      // var token = usuarioLogado.accessToken;
      var token = "";
      String urlCompleta = _urlCompleta(url);
      _logarUrl(urlCompleta, "get", true);
      http.Response response = await http.get(
        urlCompleta,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(_timeOut);

      return response;
    } catch (e) {
      return null;
    }
  }

  bool validarResponse(http.Response response) {
    if (response != null) {
      // Interacoes.logarMensagem("statusCode ${response.statusCode.toString()}");
    } else {
      // Interacoes.logarMensagem("statusCode null");
    }

    return response != null &&
        response.body.isNotEmpty &&
        response.body != "null" &&
        response.statusCode == 200;
  }
}
