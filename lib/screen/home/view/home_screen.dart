import 'package:animated_text_kit/animated_text_kit.dart';
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
    super.initState();
    controller.getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.quotesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed("/details",
                        arguments: controller.quotesList[index]);
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
                    child: Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                '${controller.quotesList[index].category}'),
                          ],
                        ),
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
