import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AdministradorController {
  createEnterprise(String city, String name, Uint8List? bytes) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    String image = base64.encode(bytes!);
    var url = Uri.parse(
        "https://nucleocasadecor-production.up.railway.app/api/empresas/");
    Map<String, String> headers = {
      'Authorization': "Token $token",

    };

    print(image);

    Map<String, dynamic> body = {
      "foto": image,
      "nome": name,
      "cidade": city,
    };
    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
