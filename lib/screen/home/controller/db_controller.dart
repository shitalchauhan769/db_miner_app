import 'package:db_miner_quotes_app/utils/helper/db_helper.dart';
import 'package:get/get.dart';

import '../model/db_category_model.dart';
import '../model/db_quotes_model.dart';

class DbController extends GetMaterialController
{
  RxList<DBQuotesModel> dbQuotesModelList=<DBQuotesModel>[].obs;
  RxList<DBCategoryModel> dbCategoryModelList=<DBCategoryModel>[].obs;
  DbHelper helper=DbHelper();
  Future<void> readQuotes()
  async {
    dbQuotesModelList.value=await helper.readQuotes();
  }
  void readCategory()
  async {
    dbCategoryModelList.value=await helper.readCategory();
  }
}