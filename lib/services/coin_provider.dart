import 'package:http/http.dart';

class CoinProvider {
  Map<String, dynamic> coinList = {};

  Future getCoinsData() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/list?include_platform=true';
    var response = await get(Uri.parse(url));
    print(response.body);
  }
}
