import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalStorage {
  SharedPreferences pref;

  Future<String> ler(String id) async {
    pref = await SharedPreferences.getInstance();
    var jsonEntidade = pref.getString(id);
    return jsonEntidade;
  }

  Future<bool> excluir(String id) async {
    pref = await SharedPreferences.getInstance();
    return pref.remove(id);
  }

  Future<bool> salvar(String id, String json) async {
    pref = await SharedPreferences.getInstance();
    return await pref.setString(id, json);
  }
}
