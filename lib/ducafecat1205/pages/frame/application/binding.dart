import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/category/logic.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/controller.dart';

import 'logic.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationPageController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => CategoryController());


  }
}
