

import 'package:sqflite/sqflite.dart';

import '../../screen/home/model/db_category_model.dart';
import '../../screen/home/model/db_quotes_model.dart';

class DbHelper
{
  Database? database;

  Future<Database> checkDB() async {
    if (database == null) {

      database = await initDB();
    }
    return database!;
  }

  Future<Database> initDB() async {

    String folder = await getDatabasesPath();
    String path = "$folder/demo.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query = "CREATE TABLE quotes (id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT,quotes TEXT)";
        String query1= ("CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,indexJson INTEGER)");
        db.execute(query);
        db.execute(query1);

      },
    );
  }

  Future<void> insertQuotes(DBQuotesModel dbQuotesModel) async {
    database = await checkDB();
    database!.insert("quotes",
        {
          "quote": dbQuotesModel.quote,
          "author": dbQuotesModel.author,
          "category": dbQuotesModel.category,
        }
        );

  }
  Future<List<DBQuotesModel>> readQuotes() async {
    database = await checkDB();
    List<Map> l1 =await database!.rawQuery("SELECT * FROM quotes");
    List<DBQuotesModel> quotesList=l1.map((e) => DBQuotesModel.mapToModel(e)).toList();
    return quotesList;
  }
  Future<void> deleteQuotes({required int id}) async {
    database = await checkDB();
   database!.delete("quotes",whereArgs: [id],where: "id==?");
  }

  Future<void> insertCategory(DBCategoryModel dbCategoryModel) async {
    database = await checkDB();
    database!.insert("category",{"category":dbCategoryModel.category,"indexJson":dbCategoryModel.index} );
  }
  Future<List<DBCategoryModel>> readCategory() async {
    database = await checkDB();
    List <Map>l1 =await database!.rawQuery("SELECT * FROM category");
    List<DBCategoryModel> categoryList=l1.map((e) => DBCategoryModel.mapToModel(e)).toList();
    return categoryList;
  }
  Future<void> deleteCategory({required int id}) async {
    database = await checkDB();
    database!.delete("category",whereArgs: [id],where: "id==?");
  }

}