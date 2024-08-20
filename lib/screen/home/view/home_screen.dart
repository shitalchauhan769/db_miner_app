import 'package:db_miner_quotes_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    controller.getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
      ),

      // body: FutureBuilder(
      //   future: controller.quotesModel,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(child: Text("${snapshot.error}"));
      //     }
      //     else if (snapshot.hasData) {
      //       // NewsModel? model = snapshot.data;
      //       // providerR!.articlesList.addAll(model!.articlesList!);
      //
      //       QuotesModel? model = snapshot.data;
      //       // controller.resultsList.addAll(model!.resultsList!);
      //
      //       if (model == null) {
      //         return const Center(child: Text("not available"));
      //       }
      //       else if (controller.resultsList.isEmpty) {
      //         return const Center(child: Text("search another topic"));
      //       }
      //       else {
      //         return Expanded(
      //           child: GridView.builder(
      //             itemCount: model.length,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2),
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 children: [
      //                   Obx(
      //                     () => Container(
      //                       height: 200,
      //                       width: 200,
      //                       decoration: const BoxDecoration(
      //                         color: Colors.white,
      //                       ),
      //                       child: Center(
      //                         child: Text(
      //                             "${controller.resultsList[index].tags}"),
      //                       ),
      //                     ),
      //                   )
      //                   // Text("Hello"),
      //                 ],
      //               );
      //             },
      //           ),
      //         );
      //       }
      //
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      //
      // ),

    );
  }
}
