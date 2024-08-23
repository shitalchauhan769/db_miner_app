import 'package:db_miner_quotes_app/screen/home/controller/db_controller.dart';
import 'package:db_miner_quotes_app/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';
import '../../home/model/db_quotes_model.dart';
import '../../home/model/home_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  QuotesJsonModel quotes = Get.arguments;
  QuotesController controller = Get.put(QuotesController());
  DbController controllerDb=Get.put(DbController());
  @override
  void initState() {
    super.initState();
    controller.favoriteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EditScreen"),
        actions: [
          IconButton(
            onPressed: () async {
              DBQuotesModel dbQuotesModel =DBQuotesModel(
                quote: "${quotes.quote}",
                author: "${quotes.author}",


              );
              DbHelper helper=DbHelper();
             bool isEmpty=await helper.checkQ(quotes.quote!);
             if(isEmpty==true)
               {
                 helper.insertQuotes(dbQuotesModel);
                 controller.favoriteData();
                 Get.snackbar("Successful", "add");
                 Get.toNamed("/favourite");
               }
             else
               {
                 Get.snackbar("error", "arladey agzish");
                 Get.toNamed("/favourite");
               }

            },
            icon: const Icon(Icons.favorite),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              alignment: Alignment.center,
        
              padding: const EdgeInsets.all(10),
              decoration:  const BoxDecoration(
                  color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/background.jpg"),fit: BoxFit.cover,
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " “ ${quotes.quote} ” ",
                    style:  TextStyle(fontSize: 18,fontWeight:FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 100,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "- ${quotes.author}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
