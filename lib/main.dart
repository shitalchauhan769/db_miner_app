import 'package:db_miner_quotes_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_quotes_app/utils/app_routes.dart';
import 'package:db_miner_quotes_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  QuotesController controller = Get.put(QuotesController());
  controller.getTheme();
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme:lightTheme,
        darkTheme: darkTheme,
        themeMode: controller.themeName.value == "dark"
            ? ThemeMode.dark
            : ThemeMode.light,
        // themeMode: controller.theme =="Light"
        //     ?ThemeMode.light
        //     :controller.theme=="Dark"
        //     ?ThemeMode.dark
        //     :ThemeMode.system,
        routes: app_routes,
      ),
    ),
  );
}
