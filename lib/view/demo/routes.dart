import 'package:flutter/material.dart';
import 'package:untitled/view/demo/CustomMulti.dart';
import 'package:untitled/view/demo/Demo1112.dart';
import 'package:untitled/view/demo/SearchPage.dart';
import 'package:untitled/view/demo/channel/channel1118.dart';
import 'package:untitled/view/demo/get/CountGetPage.dart';
import 'package:untitled/view/demo/loginPage.dart';

Map<String, WidgetBuilder> routes = {
  "login": (context) => LoginPage(),
  "/searchPage": (context) => SearchPage(),
  "/custommultichildlayout": (context) => CustomMulti(),
  "/Demo1112": (context) => Demo1112(),
  "/CountGetPage": (context) => CountGetPage(),
  "/PlatformChannel": (context) => PlatformChannel()
};
