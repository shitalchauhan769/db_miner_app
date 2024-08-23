import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {

  static ShareHelper helper =ShareHelper._();
  ShareHelper._();
  void setTheme({required String theme}) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    print(theme);
    s1.setString("mode", theme);
  }

  Future<String?> getTheme() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
   String? theme1= s1.getString("mode");
   print(theme1);
    return theme1;
  }
  // Future<void> setCategoryList(List<String> category) async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   await shr.setStringList('category', category);
  // }
  // Future<void> setQuotesList(List<String> quotes) async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   await shr.setStringList('quotes', quotes);
  // }
  //
  // Future<List<String>> getCategoryList() async {
  //   SharedPreferences shr= await SharedPreferences.getInstance();
  //   List<String>category= shr.getStringList("category")??[];
  //   return category;
  // }
  // Future<List<String>> getQuotesList() async {
  //   SharedPreferences shr= await SharedPreferences.getInstance();
  //   List<String>quotes= shr.getStringList("quotes")??[];
  //   return quotes;
  // }

}

