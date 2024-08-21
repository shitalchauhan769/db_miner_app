import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';

import 'package:get/get.dart';

import '../../../utils/helper/json_helper.dart';

class QuotesController extends GetxController {

  RxList<QuotesModel>quotesList=<QuotesModel>[].obs;
  QuotesHelper helper = QuotesHelper();


  void getQuotes() async {
     quotesList.value =await helper.quotesJson();
  }
}
