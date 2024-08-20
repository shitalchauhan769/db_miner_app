import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:db_miner_quotes_app/utils/helper/api_helper.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  Future<QuotesModel ?>? quotesModel;
  RxList<QuotesModel>quotseList=<QuotesModel>[].obs;



  void getQuotes() {
    QuotesHelper helper = QuotesHelper();
    quotesModel = helper.quotesAPI();

    quotesModel!.then(
      (value) {
        update();
      },
    );
    // quotseList.addAll(quotesModel);
  }
}
