import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/category/logic.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/controller.dart';
import 'package:untitled/ducafecat1205/pages/wanandroid/home/bindings.dart';
import 'package:untitled/ducafecat1205/pages/wanandroid/home/controller.dart';

import 'logic.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationPageController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => wandroidgzhController());


  }
}
