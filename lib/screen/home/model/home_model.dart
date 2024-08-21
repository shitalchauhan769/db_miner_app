class QuotesModel{
  String? category;
  List<QuotesJsonModel>? quotesList=[];

  QuotesModel({this.category, this.quotesList});
  factory QuotesModel.mapToModel(Map m1)
  {
    List l1 = m1["shital"];
    return QuotesModel(category: m1["category"],quotesList: l1.map((e) => QuotesJsonModel.mapToModel(e)).toList());
  }
}

class QuotesJsonModel {
  String? quote,author;

  QuotesJsonModel({this.quote, this.author});
  factory QuotesJsonModel.mapToModel(Map m1)
  {
    return QuotesJsonModel(author: m1["author"],quote: m1["quote"]);
  }
}
