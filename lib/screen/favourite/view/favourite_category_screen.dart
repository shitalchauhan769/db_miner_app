import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/helper/db_helper.dart';
import '../../home/controller/db_controller.dart';

class FavouriteCategoryScreen extends StatefulWidget {
  const FavouriteCategoryScreen({super.key});

  @override
  State<FavouriteCategoryScreen> createState() =>
      _FavouriteCategoryScreenState();
}

class _FavouriteCategoryScreenState extends State<FavouriteCategoryScreen> {
  DbController controller1 = Get.put(DbController());
  DbHelper helper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoriteCategory"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller1.dbCategoryModelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${controller1.dbCategoryModelList[index].category}"),
                        IconButton(
                          onPressed: () {
                            // helper.deleteQuotes(id: controller1.dbQuotesModelList[index].id!);
                            helper.deleteCategory(
                                id: controller1.dbCategoryModelList[index].id!);

                            controller1.readCategory();
                          },
                          icon: const Icon(Icons.delete),
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
