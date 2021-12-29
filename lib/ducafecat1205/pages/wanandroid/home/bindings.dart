import 'package:get/get.dart';

import 'controller.dart';

class GzhCegBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => wandroidgzhController());

  }

}