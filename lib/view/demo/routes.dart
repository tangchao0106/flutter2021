import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/demo/CustomMulti.dart';
import 'package:untitled/view/demo/Demo1112.dart';
import 'package:untitled/view/demo/SearchPage.dart';
import 'package:untitled/view/demo/channel/channel1118.dart';
import 'package:untitled/view/demo/get/CountGetPage.dart';
import 'package:untitled/view/demo/loginPage.dart';

import 'Demo1129Feature.dart';
import 'flutter_slidable.dart';
import 'get/getx/view.dart';

Map<String, WidgetBuilder> routes = {
  "login": (context) => LoginPage(),
  "/searchPage": (context) => SearchPage(),
  "/custommultichildlayout": (context) => CustomMulti(),
  "/Demo1112": (context) => Demo1112(),
  "/CountGetPage": (context) => CountGetPage(),
  "/PlatformChannel": (context) => PlatformChannel(),
  "/GetxPage": (context) => GetxPage(),
  "/Feature11129": (context) => Feature11129(),
  "/Slidable": (context) => MyAppSlidable(),
};
