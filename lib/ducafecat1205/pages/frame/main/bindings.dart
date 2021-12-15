import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
