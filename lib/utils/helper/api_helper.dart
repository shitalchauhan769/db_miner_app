import 'dart:convert';

import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class QuotesHelper {
  Future<QuotesModel ?>? quotesAPI() async {
    String link =
        "assets/json/quotes.json";
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      QuotesModel? model = QuotesModel.mapToModel(json);

      return model;
    }
    return null;
  }
}
