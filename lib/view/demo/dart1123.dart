import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestDart extends GetxController {
  void main() {
    // 函数内部也可以定义其他函数，实现嵌套调用。大多数情况下这种方式适用于进行即时的回调
    void t1() {}
    void t2() {}

    var names = ["a", "b", "c"];
    names.forEach((element) {
      print(element);
    });
    // Dart 提供了一种直接将该函数作为参数传递过去就好了
    names.forEach(print);
  }
}
