import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/sign_in/controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
