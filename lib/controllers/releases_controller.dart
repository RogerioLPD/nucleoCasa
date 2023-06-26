import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class ReleasesController {
  doRelease(value, text1, text2) async {
    int valor = int.parse(value);
    int especificador = int.parse(text1);
    int empresa = int.parse(text2);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    var url = Uri.parse(
        "https://nucleocasadecor-production.up.railway.app/api/compra/nova/");
    Map<String, String> headers = {
      'Authorization': "Token $token",
      'content-type': 'application/json',
    };

    Map<String, dynamic> body = {
      "valor": valor,
      "especificador": especificador,
      "empresa": empresa
    };
    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // if (kDebugMode) {
        //   print(token);
        // }
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
