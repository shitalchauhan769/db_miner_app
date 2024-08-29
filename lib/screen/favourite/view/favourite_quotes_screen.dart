import 'package:db_miner_quotes_app/screen/home/controller/db_controller.dart';
import 'package:db_miner_quotes_app/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../home/controller/home_controller.dart';
import '../../home/model/home_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // QuotesJsonModel quotes = Get.arguments;
  QuotesController controller = Get.put(QuotesController());
  DbController controller1=Get.put(DbController());
  DbHelper helper=DbHelper();
  @override
  void initState() {
    super.initState();
    controller1.readQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoriteQuotes"),
      ),
      body: Obx(
        () =>  ListView.builder(
          itemCount:controller1.dbQuotesModelList.length ,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffff5339),
                          Color(0xffff126e),
                        ],
                      ),
                    ),
                    child: Column(

                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${controller1.dbQuotesModelList[index].quote}"),
                        Align(alignment: Alignment.bottomRight,
                          child: Text("- ${controller1.dbQuotesModelList[index].author}"),
                        ),
                        Align(alignment: Alignment.centerRight,
                          child: IconButton(onPressed: () {
                            helper.deleteQuotes(id: controller1.dbQuotesModelList[index].id!);
                            controller1.readQuotes();


                          }, icon: const Icon(Icons.delete),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
