import 'package:db_miner_quotes_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_quotes_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  QuotesController controller=Get.put(QuotesController());
  runApp(
     GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: controller.theme =="Light"
              ?ThemeMode.light
              :controller.theme=="Dark"
              ?ThemeMode.dark
              :ThemeMode.system,
          routes: app_routes,
        ),


  );
}
