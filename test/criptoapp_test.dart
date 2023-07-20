import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  test('Check API Coingecko server status', () async {
    var response =
        await get(Uri.parse('https://api.coingecko.com/api/v3/ping'));
    expect(response.statusCode, 200);
  });
}
