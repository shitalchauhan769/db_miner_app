import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EditController extends  GetxController
{
   //text
   RxList textList = ["OpenSans","Sevillana","Poppins","Kanit","OpenSans2"].obs;
   RxBool textOn = false.obs;
   RxString textStyle = "OpenSana".obs;

   //image
   RxList imageList = ["assets/image/img1.jpg", "assets/image/img3.jpg", "assets/image/img4.jpg", "assets/image/img5.jpg", "assets/image/img6.jpg", "assets/image/img7.jpg"].obs;
   RxBool imageOn = false.obs;
   RxString imagePart = "assets/image/img1.jpg".obs;

   //color
   Rx<Color> selected = Colors.black.obs;
   RxBool colorOn = false.obs;
   RxString name = "".obs;

   //textchange
   // void textChange() {
   //   textOn = textOn;
   // }
   //
   // //image change
   // void imageChange()
   // {
   //    imageOn = imageOn;
   // }
   //
   // //color change
   // void colorChange()
   // {
   //    colorOn = colorOn;
   // }
}

