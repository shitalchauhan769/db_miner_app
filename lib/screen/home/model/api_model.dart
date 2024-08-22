class QuotesAPiModel
{
  String?quote,author,category;

  QuotesAPiModel({this.quote, this.author, this.category});
  factory QuotesAPiModel.mapToModel(Map m1)
  {
    return QuotesAPiModel(quote: m1['quote'],category: m1['category'],author: m1['author']);
  }
}