import 'package:smart_query/Modelo/smartQueryMotor.dart';
import 'baseHttp.dart';

class SmartQueryHTTP extends BaseHttp {
  Future<String> salvaMotor(SmartqueryMotor motor) async {
    var response = await requestPost("Motor", motor);
    if (validarResponse(response)) {
      return response.body;
    }
    return null;
  }
}
