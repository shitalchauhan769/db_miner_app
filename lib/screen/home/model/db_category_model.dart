class DBCategoryModel{
  int? id;
  String? category;

  DBCategoryModel({this.id, this.category});
  factory DBCategoryModel.mapToModel(Map m1)
  {
    return DBCategoryModel(id: m1["id"],category: m1["category"]);
  }
}