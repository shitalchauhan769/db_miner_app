import 'package:db_miner_quotes_app/screen/home/model/api_model.dart';
import 'package:db_miner_quotes_app/utils/helper/api_helper.dart';
import 'package:get/get.dart';

class APIController extends GetxController
{
  RxList<List<QuotesAPiModel>>quotesList=<List<QuotesAPiModel>>[].obs;
  APIHelper helper=APIHelper();
  void getQuotesAPI()
  {
    quotesList.value= helper.quotesAPI() as List<List<QuotesAPiModel>> ;
  }
}