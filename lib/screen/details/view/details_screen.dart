import 'package:db_miner_quotes_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  QuotesModel quotes = Get.arguments;
  QuotesController controller = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${quotes.category}"),
        ),
        body: ListView.builder(
          itemCount: quotes.quotesList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed("/edit", arguments: quotes.quotesList![index]);
              },
              child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 150,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  gradient: const LinearGradient(

                      colors: [

                        // Color(0xff59d8bb),
                        // Color(0xffcaa646),
                        // Color(0xffff8703),
                        Color(0xffff5339),
                        Color(0xffff126e),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "“${quotes.quotesList![index].quote}”",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "- ${quotes.quotesList![index].author}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
