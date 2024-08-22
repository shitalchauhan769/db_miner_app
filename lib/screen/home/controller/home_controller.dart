import 'package:db_miner_quotes_app/screen/home/model/db_quotes_model.dart';
import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:db_miner_quotes_app/utils/helper/db_helper.dart';

import 'package:get/get.dart';

import '../../../utils/helper/json_helper.dart';

class QuotesController extends GetxController {

  RxList<QuotesModel>quotesList=<QuotesModel>[].obs;
  QuotesHelper helper = QuotesHelper();
  RxList<DBQuotesModel> favouriteList = <DBQuotesModel>[].obs;
  DbHelper helper1=DbHelper();

  void getQuotes() async {
     quotesList.value =await helper.quotesJson();
  }
  Future<void> favoriteData()
  async {
    List<DBQuotesModel>? l2= (await helper1.readQuotes()).cast<DBQuotesModel>();
    favouriteList.value=l2;
  }
}
