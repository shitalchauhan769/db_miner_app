import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  void setTheme({required String Theme}) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    s1.setString("theme", Theme);
  }

  Future<String?> getTheme() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    s1.getString("theme");
    return s1.getString("theme");
  }
  // Future<void> setCategoryList(List<String> category) async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   await shr.setStringList('name', category);
  // }
  // Future<void> setQuotesList(List<String> quotes) async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   await shr.setStringList('quotes', quotes);
  // }
  //
  // Future<List<String>> getCategoryList() async {
  //   SharedPreferences shr= await SharedPreferences.getInstance();
  //   List<String>category= shr.getStringList("name")??[];
  //   return category;
  // }
  // Future<List<String>> getQuotesList() async {
  //   SharedPreferences shr= await SharedPreferences.getInstance();
  //   List<String>quotes= shr.getStringList("quotes")??[];
  //   return quotes;
  // }

}

