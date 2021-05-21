import 'package:http/http.dart' as http;
import 'dart:convert';

const KEY = "BBC96A01-6FA4-41B5-88AA-94E58E076D87";

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getDate(assetIdBase, assetIdQuote) async {
    var url =
        "https://rest.coinapi.io/v1/exchangerate/$assetIdBase/$assetIdQuote?apikey=$KEY";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      String out = jsonDecode(data).toString();
      print(out);
      return out;
    } else {
      print(response.statusCode);
      return "ERRO NA API";
    }
  }
}
