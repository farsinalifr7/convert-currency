import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studentmodelhive/model/all_currency.dart';
import 'package:studentmodelhive/model/rate_model.dart';

Future<RateModel> fetchRate() async {
  var response = await http.get(Uri.parse(
      "https://openexchangerates.org/api/latest.json?base=USD&app_id=807ff33a8b0a4118ab472a4825daa16b"));
  final result = rateModelFromJson(response.body);
  return result;
  // print(result);
}

Future<Map> fetchCurrency() async {
  var response = await http.get(Uri.parse(
      "https://openexchangerates.org/api/currencies.json?app_id=807ff33a8b0a4118ab472a4825daa16b"));
  final result = allCurrencyFromJson(response.body);
  //print(result);
  return result;
}
