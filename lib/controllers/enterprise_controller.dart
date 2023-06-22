import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:nucleo/model/enterprise_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EnterpriseController {
  StreamController<List<EnterpriseItem>> dataController =
      StreamController.broadcast();
  StreamController<List<String>> cityController = StreamController.broadcast();
  StreamController<bool> isLoading = StreamController.broadcast();
  StreamController<bool> isLoadingSearch = StreamController.broadcast();
  List<EnterpriseItem> itemSecondary = [];

  EnterpriseController() {
    initValues();
  }
  List<EnterpriseItem> item = [];

  initValues() async {
    await getData();
    isLoadingSearch.sink.add(false);
  }

  getData() async {
    isLoading.sink.add(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //String token = sharedPreferences.getString('token')!;
    var url = Uri.parse(
        "http://nucleocasadecor-production.up.railway.app/api/empresas/");
    Map<String, String> headers = {
      //'Authorization': token,
      'content-type': 'application/json',
    };
    List<String> city = [];
    // Map<String, dynamic> body = {
    //   "username": _emailController.text,
    //   "password": _senhaController.text,
    // };
    city.add("Selecionar");
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        item = (json.decode(response.body) as List)
            .map((data) => EnterpriseItem.fromJson(data))
            .toList();

        dataController.sink.add(item);

        for (EnterpriseItem data in item) {
          if (!city.contains(data.city)) {
            city.add(data.city!);
          }
        }
        cityController.sink.add(city);
        isLoading.sink.add(false);
        // if (kDebugMode) {
        //   print(response.body);
        // }

      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  makeSearchBox(value) async {
    itemSecondary.clear();

    if (value == null || value == "Selecionar") {
      dataController.sink.add(item);
    } else {
      for (EnterpriseItem data in item) {
        if (data.city == value) {
          itemSecondary.add(data);
        }
      }
      dataController.sink.add(itemSecondary);
    }
  }

  mockData() {
    return json.encode([
      {"foto": null, "nome": "Eduardo Lima", "cidade": "Fortaleza"},
      {"foto": null, "nome": "Eduardo Lima", "cidade": "Fortaleza"},
      {"foto": null, "nome": "Eduardo Lima", "cidade": "Paraiba"},
      {"foto": null, "nome": "Eduardo Lima", "cidade": "Caucaia"},
      {"foto": null, "nome": "Eduardo Lima", "cidade": "São paulo"}
    ]);
  }
}
