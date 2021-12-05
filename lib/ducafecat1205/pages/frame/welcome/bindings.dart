import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/welcome/controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
