import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterGetLogic1116 extends GetxController {
  var count = 0.obs;

  void increase() {
    ++count;
    update();
  }
}

class CoutPage extends StatelessWidget {
  final logic = Get.put(CounterGetLogic1116());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder(
          builder: (CounterGetLogic1116 controller) {
            return Text("==${controller.count.value}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logic.increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GetJumpOneLogic extends GetxController {
  var count = 0;

  @override
  void onInit() {

    super.onInit();
  }
  void toJumpTwo() {
    Get.toNamed("/", arguments: {"msg": "dataaaaaaaaa"});

    void increase() {
      count = ++count;
      update();
    }
  }
}

class GetJumpOnePage extends StatelessWidget {
  final logic = Get.put(GetJumpOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨页面"),
      ),
      body: Center(
        child: GetBuilder<GetJumpOneLogic>(builder: (logic) {
          return Text("=${logic.count}");
        }),
      ),
    );
  }
}
