import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/view/demo/get/User.dart';
//使用controller优点 1 前后端分离，2 自动回收，不占用内存 3
class CounterGetLogic extends GetxController {
  var count = 0.obs;
  var logger = Logger();

  // void increase() {
  //   count++;
  // }
  void increase() {
    count++;
    update(['a1']);
  }

  final user = User().obs;

  void update1() {
    user?.update((user) {
      user!.name = "tc";
      user!.age = 20;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(count, (callback) => {logger.d("我是ever${count.value}")});

    // once(count, (callback) => {logger.d(count.value)});
    //
    // debounce(count, (callback) => {logger.d(count.value)},
    //     time: Duration(seconds: 2));
    //
    // interval(count, (callback) => {logger.d(count.value)},
    //     time: Duration(seconds: 2));
  }
}

// Obx()方法刷新的条件
//
// 只有当响应式变量的值发生变化时，才会会执行刷新操作，当某个变量初始值为：“test”，再赋值为：“test”，并不会执行刷新操作
// 当你定义了一个响应式变量，该响应式变量改变时，包裹该响应式变量的Obx()方法才会执行刷新操作，其它的未包裹该响应式变量的Obx()方法并不会执行刷新操作，Cool！
//
// 作者：小呆呆666
// 链接：https://juejin.cn/post/6924104248275763208
// 来源：稀土掘金
// 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
