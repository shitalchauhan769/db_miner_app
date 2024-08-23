import 'package:db_miner_quotes_app/screen/home/model/db_category_model.dart';
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
  RxList<DBCategoryModel> favouriteList1 = <DBCategoryModel>[].obs;
  String themeName = "system";
  String? theme;
  DbHelper helper1=DbHelper();
  RxList<String> bookMarkQuotesList=<String>[].obs;
  RxList<String> bookMarkCategoryList=<String>[].obs;

  void setQuotesBookMark(String quotes,String category)
  {
    bookMarkCategoryList.add(category);
    bookMarkQuotesList.add(quotes);
    ShareHelper.helper.setCategoryList(bookMarkCategoryList);
    ShareHelper.helper.setQuotesList(bookMarkQuotesList);

  }


  void getQuotes() async {
     quotesList.value =await helper.quotesJson();
  }

  Future<void> favoriteData() async {
    List<DBQuotesModel>? l2= (await helper1.readQuotes()).cast<DBQuotesModel>();
    favouriteList.value=l2;
  }

  Future<void> favoriteCategory()
  async {
    List<DBCategoryModel>? l1=(await helper1.readCategory());
    favouriteList1.value=l1;

  }


  void setTheme(String theme) {

    ShareHelper.helper.setTheme(Theme: theme);
    getTheme();
  }

  Future<void> getTheme() async {

    theme = await ShareHelper.helper.getTheme();

  }
}
