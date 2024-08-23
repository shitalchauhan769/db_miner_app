import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_quotes_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_quotes_app/screen/home/model/db_category_model.dart';
import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:db_miner_quotes_app/utils/helper/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/helper/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.getQuotes();
    controller.favoriteCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Light"),
                onTap: () {
                  controller.setTheme("light");
                },
              ),
              PopupMenuItem(
                child: const Text("Dark"),
                onTap: () {
                  controller.setTheme("dark");
                },
              ),
              PopupMenuItem(
                child: const Text("System"),
                onTap: () {
                  controller.setTheme("system");
                },
              ),
            ],
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.quotesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      "/details",
                      arguments: controller.quotesList[index],
                    );
                  },
                  child: Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffff5339),
                          Color(0xffff126e),
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    '${controller.quotesList[index].category}'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              DBCategoryModel dbcategoryModel = DBCategoryModel(
                                category:
                                    "${controller.quotesList[index].category}",
                              );
                              DbHelper helper = DbHelper();
                              bool isEmpty = await helper.checkC(
                                  controller.quotesList[index].category!);
                              if (isEmpty == true) {
                                helper.insertCategory(dbcategoryModel);
                                controller.favoriteCategory();
                                Get.snackbar("Successful", "add");
                                Get.toNamed("/categoryFavourite");
                              } else {
                                Get.snackbar("error", "arladey agzish");
                                Get.toNamed("/categoryFavourite");
                              }
                            },
                            icon: const Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
