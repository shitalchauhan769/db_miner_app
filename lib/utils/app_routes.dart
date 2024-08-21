import 'package:db_miner_quotes_app/screen/details/view/details_screen.dart';
import 'package:db_miner_quotes_app/screen/edit/view/edit_screen.dart';
import 'package:db_miner_quotes_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(c1)=>const SplashScreen(),
  '/home':(c1)=>const HomeScreen(),
  '/details':(c1)=>const DetailsScreen(),
  '/edit':(c1)=>const EditScreen(),

};