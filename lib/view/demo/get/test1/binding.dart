import 'package:get/get.dart';

import 'logic.dart';
//在项目初始化的时候把所有需要进行状态管理的控制器进行统一初始化。
class DefaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DefaLogic());
  }
}
