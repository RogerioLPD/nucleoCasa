import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucleo/model/acquisitions_item.dart';
import 'package:nucleo/model/user_details.dart';
import 'package:nucleo/pages/premios/viagem_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SpecifierController {
  final StreamController<List<AcquisitionsItem>> detailsController =
      StreamController.broadcast();
  final StreamController<int> pointsController = StreamController.broadcast();
  final StreamController<UserDetails> userController =
      StreamController.broadcast();

  final PageController pageController = PageController(initialPage: 0);
  SpecifierController() {
    initValues();
  }

  initValues() async {
    await getData();
    await getGetUser();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    var url = Uri.parse(
        "https://nucleocasadecor-production.up.railway.app/api/compras/especificador/");
    Map<String, String> headers = {
      'Authorization': "Token $token",
      'content-type': 'application/json',
    };
    List<AcquisitionsItem> item = [];
    // Map<String, dynamic> body = {
    //   "username": _emailController.text,
    //   "password": _senhaController.text,
    // };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        if (json.decode(response.body) != []) {
          item = (json.decode(response.body) as List)
              .map((data) => AcquisitionsItem.fromJson(data))
              .toList();
          int valueTotal = 0;
          for (AcquisitionsItem data in item) {
            int value = int.parse(data.valor!);
            valueTotal = valueTotal + value;
          }
          print(valueTotal);
          pointsController.sink.add(valueTotal);
          detailsController.sink.add(item);
          // if (kDebugMode) {
          //   print(response.body);
          // }
        }
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  getGetUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    var url = Uri.parse(
        "https://nucleocasadecor-production.up.railway.app/api/usuario/$token");
    Map<String, String> headers = {
      'Authorization': "Token $token",
      'content-type': 'application/json',
    };
    UserDetails item;
    // Map<String, dynamic> body = {
    //   "username": _emailController.text,
    //   "password": _senhaController.text,
    // };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        if(json.decode(response.body) != []){
          item = UserDetails.fromJson(json.decode(response.body));

          userController.sink.add(item);
          int valueTotal = 0;
          // if (kDebugMode) {
          //   print(response.body);
          // }
        }
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
