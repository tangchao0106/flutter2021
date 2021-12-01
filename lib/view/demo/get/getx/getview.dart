import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../test1/binding.dart';
import 'logic.dart';

//如果只有单个控制器的可以使用getview
class GetViewDemo extends GetView<GetxLogic> {
  @override
  Widget build(BuildContext context) {
    Get.put(GetxLogic(userId: "1")); //初始化控制器

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("GetView==${controller.count}")), //直接使用controller
      ),
      body: controller.obx((persion) => HomePage1(),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onError: (error) => Center(
                child: Text(error!),
              ),
          onEmpty: Center(
            child: Text("无数据"),
          )),
    );
  }
}

// NotifierBuilder<T?> widget：实际就是一个携带状态变量，返回正常状态界面的函数，NotifierBuilder<T?>的定义如下。通过这个方法可以使用状态变量构建正常界面。
// onError：错误时对应的 Widget构建函数，可以使用错误信息 error。
// onLoading：加载时对应的 Widget；
// onEmpty：数据为空时的 Widget
//
// 作者：岛上码农
// 链接：https://juejin.cn/post/7011676146672599076
// 来源：稀土掘金
// 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//GetWidget越getview区别，在于GetWidget将控制器实例缓存起来
//通过 Get.create 生成的实例，在get.find时候会生成新的实例，
//使用GetWidget将creat创建的实例缓存起来，以便在操作同一控制器的多个实例场景

class GetWidgetDemo extends GetWidget<GetxLogic> {
  @override
  Widget build(BuildContext context) {
    GetUtils.isBinary("s");
    //通过非单例模式创建的
    Get.create(() => GetxLogic(userId: "2"));

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("GetView==${controller.count}")), //直接使用controller
      ),
      body: Container(
        child: Text(
            "//GetWidget越getview区别，在于GetWidget将控制器实例缓存起来，通过 Get.create 生成的实例，在get.find时候会生成新的实例，使用GetWidget将creat创建的实例缓存起来，以便在操作同一控制器的多个实例场景"),
        // child: Obx(() => Text("DefaBinding${Get.find<DefaBinding>().binding}")),
      ),
    );
  }
}
