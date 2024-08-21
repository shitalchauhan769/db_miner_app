import 'dart:convert';

import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';


class QuotesHelper{

  Future<List<QuotesModel>> quotesJson()
  async {
    String jsonString = await rootBundle.loadString("assets/json/quotes.json");
    List<dynamic> json =jsonDecode(jsonString);
    List <QuotesModel> quotesList=json.map((e) => QuotesModel.mapToModel(e)).toList();
    return quotesList;
  }
}