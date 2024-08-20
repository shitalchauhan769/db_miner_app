class QuotesModel
{

  // GeneralModel? general;
  // LifeModel? life;
  // SuccessModel? success;
  // MotivationalModel? motivational;
  // FunModel? fun;
  // ProgrammingModel?  programming;
  // DreamModel?  dream;
  // FailureModel? failure;
  // GamingModel? gaming;
  // BirthdayModel? birthday;
  // HumorousModel? humorous;
  // TravelModel? travel;

  List<GeneralModel>?generalList=[];
  List<LifeModel>?lifeList=[];
  List<SuccessModel>?successList=[];
  List<MotivationalModel>?motivationalList=[];
  List<FunModel>?funList=[];
  List<ProgrammingModel>?programmingList=[];
  List<DreamModel>?dreamList=[];
  List<FailureModel>?failureList=[];
  List<GamingModel>?gamingList=[];
  List<BirthdayModel>?birthdayList=[];
  List<HumorousModel>?humorousList=[];
  List<TravelModel>?travelList=[];

  QuotesModel(
      {this.generalList,
      this.lifeList,
      this.successList,
      this.motivationalList,
      this.funList,
      this.programmingList,
      this.dreamList,
      this.failureList,
      this.gamingList,
      this.birthdayList,
      this.humorousList,
      this.travelList});


  factory QuotesModel.mapToModel(Map m1)
  {
    List g1 = m1['general'];
    List l1 = m1['life'];
    List s1 = m1['success'];
    List m2 = m1['motivational'];
    List f1 = m1['fun'];
    List p1 = m1['programming'];
    List d1 = m1['dream'];
    List f2 = m1['failure'];
    List g2 = m1['gaming'];
    List b2 = m1['birthday'];
    List h1 = m1['Humorous'];
    List t1 = m1['travel'];

    return QuotesModel(
      generalList: g1.map((e) => GeneralModel.mapToModel(e),).toList(),
      lifeList: l1.map((e) => LifeModel.mapToModel(e),).toList(),
      successList: s1.map((e) => SuccessModel.mapToModel(e),).toList(),
      motivationalList: m2.map((e) => MotivationalModel.mapToModel(e),).toList(),
      funList: f1.map((e) => FunModel.mapToModel(e),).toList(),
      programmingList: p1.map((e) => ProgrammingModel.mapToModel(e),).toList(),
      dreamList: d1.map((e) => DreamModel.mapToModel(e),).toList(),
      failureList: f2.map((e) => FailureModel.mapToModel(e),).toList(),
      gamingList: g2.map((e) => GamingModel.mapToModel(e),).toList(),
      birthdayList: b2.map((e) => BirthdayModel.mapToModel(e),).toList(),
      humorousList: h1.map((e) => HumorousModel.mapToModel(e),).toList(),
      travelList: t1.map((e) => TravelModel.mapToModel(e),).toList(),
    );
  }

// QuotesModel(
  //     {this.general,
  //     this.life,
  //     this.success,
  //     this.motivational,
  //     this.fun,
  //     this.programming,
  //     this.dream,
  //     this.failure,
  //     this.gaming,
  //     this.birthday,
  //     this.humorous,
  //     this.travel});
  //
  // factory QuotesModel.mapToModel(Map m1)
  // {
  //   return QuotesModel()
  // }
}
class GeneralModel
{
  String? quote,author;

  GeneralModel({this.quote, this.author});
  factory GeneralModel.mapToModel(Map m1)
  {
    return GeneralModel(author: m1['author'],quote: m1['quote']);
  }

}
class LifeModel
{
  String? quote,author;

  LifeModel({this.quote, this.author});
  factory LifeModel.mapToModel(Map m1)
  {
    return LifeModel(author: m1['author'],quote: m1['quote']);
  }

}
class SuccessModel
{
  String? quote,author;

  SuccessModel({this.quote, this.author});
  factory SuccessModel.mapToModel(Map m1)
  {
    return SuccessModel(author: m1['author'],quote: m1['quote']);
  }

}
class MotivationalModel
{
  String? quote,author;

  MotivationalModel({this.quote, this.author});
  factory MotivationalModel.mapToModel(Map m1)
  {
    return MotivationalModel(author: m1['author'],quote: m1['quote']);
  }

}
class FunModel
{
  String? quote,author;

  FunModel({this.quote, this.author});
  factory FunModel.mapToModel(Map m1)
  {
    return FunModel(author: m1['author'],quote: m1['quote']);
  }

}
class ProgrammingModel
{
  String? quote,author;

  ProgrammingModel({this.quote, this.author});
  factory ProgrammingModel.mapToModel(Map m1)
  {
    return ProgrammingModel(author: m1['author'],quote: m1['quote']);
  }

}
class DreamModel
{
  String? quote,author;

  DreamModel({this.quote, this.author});
  factory DreamModel.mapToModel(Map m1)
  {
    return DreamModel(author: m1['author'],quote: m1['quote']);
  }

}
class FailureModel
{
  String? quote,author;

  FailureModel({this.quote, this.author});
  factory FailureModel.mapToModel(Map m1)
  {
    return FailureModel(author: m1['author'],quote: m1['quote']);
  }

}
class GamingModel
{
  String? quote,author;

  GamingModel({this.quote, this.author});
  factory GamingModel.mapToModel(Map m1)
  {
    return GamingModel(author: m1['author'],quote: m1['quote']);
  }

}
class BirthdayModel
{
  String? quote,author;

  BirthdayModel({this.quote, this.author});
  factory BirthdayModel.mapToModel(Map m1)
  {
    return BirthdayModel(author: m1['author'],quote: m1['quote']);
  }

}
class HumorousModel
{
  String? quote,author;

  HumorousModel({this.quote, this.author});
  factory HumorousModel.mapToModel(Map m1)
  {
    return HumorousModel(author: m1['author'],quote: m1['quote']);
  }

}
class TravelModel
{
  String? quote,author;

  TravelModel({this.quote, this.author});
  factory TravelModel.mapToModel(Map m1)
  {
    return TravelModel(author: m1['author'],quote: m1['quote']);
  }
}












// class QuotesModel {
//   int? count, totalCount, page, totalPages, lastItemIndex;
//   List<ResultsModel>? resultsList = [];
//
//   QuotesModel(
//       {this.count,
//       this.totalCount,
//       this.page,
//       this.totalPages,
//       this.lastItemIndex,
//       this.resultsList});
//
//   factory QuotesModel.mapToModel(Map m1) {
//     List l1 = m1['results'];
//     return QuotesModel(
//         totalPages: m1['totalPages'],
//         totalCount: m1['totalCount'],
//         page: m1['page'],
//         lastItemIndex: m1['lastItemIndex'],
//         count: m1['count'],
//         resultsList: l1.map((e) => ResultsModel.mapToModel(e),).toList());
//   }
// }
//
// class ResultsModel {
//   String? id, author, content, authorSlug, dateAdded, dateModified;
//   List<dynamic>tags;
//   int? length;
//
//   ResultsModel(
//       {this.id,
//       this.author,
//       this.content,
//       this.authorSlug,
//       this.dateAdded,
//       this.dateModified,
//       required this.tags,
//       this.length});
//
//   factory ResultsModel.mapToModel(Map m1) {
//     return ResultsModel(
//         id: m1['id'],
//         content: m1['content'],
//         length: m1['length'],
//         dateModified: m1['dateModified'],
//         dateAdded: m1['dateAdded'],
//         authorSlug: m1['authorSlug'],
//         author: m1['author'],
//         tags: m1['tags']);
//   }
// }
//



// class TagsModel
// {
//
// }
