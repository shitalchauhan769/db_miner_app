import 'package:db_miner_quotes_app/screen/edit/controller/edit_controller.dart';
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
  DbController controllerDb = Get.put(DbController());
  EditController controllerEdit = Get.put(EditController());
  GlobalKey rapaintKey = GlobalKey();

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
              DBQuotesModel dbQuotesModel = DBQuotesModel(
                quote: "${quotes.quote}",
                author: "${quotes.author}",
              );
              DbHelper helper = DbHelper();
              bool isEmpty = await helper.checkQ(quotes.quote!);
              if (isEmpty == true) {
                helper.insertQuotes(dbQuotesModel);
                controller.favoriteData();
                Get.snackbar("Successful", "add");
                Get.toNamed("/favourite");
              } else {
                Get.snackbar("error", "arladey agzish");
                Get.toNamed("/favourite");
              }
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
           () =>  RepaintBoundary(
             key: rapaintKey,
             child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 400,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(controllerEdit.imagePart.value),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      " “ ${quotes.quote} ” ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: controllerEdit.textStyle.value,
                        color: controllerEdit.selected.value,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SelectableText(
                        "- ${quotes.author}",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: controllerEdit.textStyle.value,
                          color: controllerEdit.selected.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // textFont Change
                IconButton.filledTonal(
                  onPressed: () {
                    controllerEdit.textOn.value = true;
                    controllerEdit.colorOn.value=false;
                    controllerEdit.imageOn.value=false;


                  },
                  icon: const Icon(Icons.text_fields_outlined),
                ),

                //color
                IconButton.filledTonal(
                  onPressed: () {
                    controllerEdit.colorOn.value = true;
                    controllerEdit.textOn.value = false;
                    controllerEdit.imageOn.value=false;


                  },
                  icon: const Icon(Icons.color_lens_outlined),
                ),

                //image
                IconButton.filledTonal(
                  onPressed: () {
                    controllerEdit.imageOn.value = true;
                    controllerEdit.colorOn.value=false;
                    controllerEdit.textOn.value=false;
                  },
                  icon: const Icon(Icons.image),
                ),


                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.save_alt),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ),
          //color change
          Obx(
            () => Expanded(
              child: Visibility(
                visible: controllerEdit.colorOn.value,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: Colors.primaries.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          controllerEdit.selected.value = Colors.primaries[index];
                        },
                        child: Container(
                          height: 30,
                          width:350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.primaries[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          //image change
          Obx(
           () =>  Expanded(
             child: Visibility(
                visible: controllerEdit.imageOn.value,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: controllerEdit.imageList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                          controllerEdit.imagePart.value=controllerEdit.imageList[index];
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(
                          "${controllerEdit.imageList[index]}",
                        ),
                      ),
                      ),),
                    );
                  },
                ),
              ),
           ),
          ),

          // //text change
          Obx(
            () =>  Visibility(
              visible: controllerEdit.textOn.value,
              child: Expanded(
                child: ListView.builder(
                  itemCount: controllerEdit.textList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            controllerEdit.textStyle.value = controllerEdit.textList[index];
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          "enter text font style",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
