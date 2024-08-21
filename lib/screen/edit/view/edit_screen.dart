import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';
import '../../home/model/home_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  QuotesJsonModel quotes = Get.arguments;
  QuotesController controller = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EditScreen"),
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 400,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "“${quotes.quote}”",
                  style: const TextStyle(fontSize: 18),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.text_fields_outlined),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.color_lens),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.image),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              const Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text("Text"),
                  ],
                ),
              ),
              const Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text("colors"),
                  ],
                ),
              ),
              const Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text("image"),
                  ],
                ),
              ),
              const Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text("share"),
                  ],
                ),
              ),
              const Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text("favorite"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
