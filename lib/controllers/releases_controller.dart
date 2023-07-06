import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class ReleasesController {
  Future doRelease(value, text1, text2) async {
    String valor = value;
    String especificador = text2;
    String empresa = text1;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    var url = Uri.https("apicasadecor.com","/api/nova-compra/");
    Map<String, String> headers = {
      'Authorization': "Token $token",
    };

    var body = <String, dynamic>{};
    body['valor'] = valor;
    body['doc'] = especificador;


    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
