import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/model/coin_model.dart';

interface class CoinProvider {
  final apiUrl =
      'https://api.coingecko.com/api/v3/coins/list?include_platform=true';

  Future getCoinInformation(String url) async {
    await http.get(Uri.parse(apiUrl)).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<CoinModel> cryptocurrencies = [];

        for (var cryptoJson in jsonResponse) {
          CoinModel crypto = CoinModel.fromJson(cryptoJson);
          cryptocurrencies.add(crypto);
        }
        for (var crypto in cryptocurrencies) {
          print('ID: ${crypto.id}');
          print('Symbol: ${crypto.symbol}');
          print('Name: ${crypto.name}');
          print('Platforms: ${crypto.platforms}');
          print('---------------------------');
        }
      }
    }).catchError((error) {
      Exception('Error to process coin data');
    });
  }
}
