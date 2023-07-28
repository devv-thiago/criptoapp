import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/model/coin_model.dart';

interface class CoinProvider {
  List<CoinModel> cryptocurrencies = [];

  Future getCoinInformation(String url) async {
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        debugPrint(response.body);
        for (var cryptoJson in jsonResponse) {
          CoinModel crypto = CoinModel.fromJson(cryptoJson);
          cryptocurrencies.add(crypto);
        }
      }
    }).catchError((error) {
      Exception('Error to process coin data');
    });
  }
}
