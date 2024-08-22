import 'dart:convert';

import 'package:db_miner_quotes_app/screen/home/model/api_model.dart';
import 'package:http/http.dart' as http;
class APIHelper
{
  Future<List<QuotesAPiModel>?>? quotesAPI() async {
    String? link = "https://viditsavaliya19.github.io/JSON/quotes.json";
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      List json = await jsonDecode(response.body);
      List<QuotesAPiModel>quotesAPIList = json.map((e) =>
          QuotesAPiModel.mapToModel(e),).toList();

      return quotesAPIList;
    }
    return null;
  }
}