import 'package:db_miner_quotes_app/screen/home/model/db_quotes_model.dart';
import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:db_miner_quotes_app/utils/helper/db_helper.dart';

import 'package:get/get.dart';

import '../../../utils/helper/json_helper.dart';
import '../../../utils/helper/shared_helper.dart';

class QuotesController extends GetxController {

  RxList<QuotesModel>quotesList=<QuotesModel>[].obs;
  QuotesHelper helper = QuotesHelper();
  RxList<DBQuotesModel> favouriteList = <DBQuotesModel>[].obs;
  RxString themeName = "system".obs;
  String? theme;
  DbHelper helper1=DbHelper();

  void getQuotes() async {
     quotesList.value =await helper.quotesJson();
  }
  Future<void> favoriteData()
  async {
    List<DBQuotesModel>? l2= (await helper1.readQuotes()).cast<DBQuotesModel>();
    favouriteList.value=l2;
  }
  void setTheme(String theme) {
    ShareHelper shr = ShareHelper();
    shr.setTheme(Theme: theme);
    getTheme();
  }

  Future<void> getTheme() async {
    ShareHelper shr = ShareHelper();
    theme = await shr.getTheme();

  }
}
