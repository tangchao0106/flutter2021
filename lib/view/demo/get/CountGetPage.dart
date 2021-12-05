import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/demo/Messages.dart';
import 'package:untitled/view/demo/get/CounterGetLogic.dart';
import 'package:untitled/view/demo/get/getx/view.dart';
import 'package:untitled/view/demo/get/route_pages.dart';
import 'package:untitled/view/demo/get11128/TestOnePage.dart';
import 'package:untitled/view/demo/get11128/get1128demo.dart';

import 'getx/getview.dart';

class CountGetPage extends StatelessWidget {
  const CountGetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CounterGetLogic());
    bool ch = true;
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Getx计数器"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Obx(() => Text("${logic.count.value}")),
            ),
            Divider(),
            ListTile(
              title: Text("国际化语言 ${'hello'.tr}"),
            ),
            Divider(),
            GetX<CounterGetLogic>(builder: (logic) {
              return Text(
                  "GetX 使用里面的控制器。与obx区别，obx可以使用外部的控制器==${logic.count.toString()}");
            }),
            // GetX 使用里面的控制器。与obx区别，obx可以使用外部的控制器
            Divider(),

            // GetBuilder被动方式，性能比getx高，getx，使用流的方式，需要监听对象

            GetBuilder<CounterGetLogic>(
                id: "a1",
                builder: (logic) => Text(
                    "GetBuilder被动方式，性能比getx高，getx，使用流的方式，需要监听对象=${logic.count.toString()}")),
            GetBuilder<CounterGetLogic>(builder: (lo) {
              return Text("GetBuild===${lo.count.value}");
            }),
            Divider(),
            GestureDetector(
              onTap: () {
                Get.toNamed("/Page117", arguments: {"name": "tangchao"});
                // Get.to(Page117(), arguments: {'user': 'tc'});
              },
              child: Text("Get.toNamed Get.arguments传参"),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                var local;
                if (ch) {
                  local = Locale('en', 'US');
                } else {
                  local = Locale('cn', 'CN');
                }
                Get.updateLocale(local);
                ch = !ch;
              },
              child: ListTile(
                title: Text("改变语言"),
              ),
            ),
            Divider(
              thickness: 2,
            ),

            ListTile(
                leading: Text("练习GETX-GetViewDemo"),
                onTap: () {
                  Get.toNamed("/GetViewDemo");
                }),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Text("练习-GetWidget"),
              onTap: () => {Get.toNamed("/GetWidgetDemo")},
            ),
            ListTile(
              title: Text("Getx1128=中间件"),
              onTap: () => Get.to(TestOnePage()),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            logic.increase();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AwesomeController extends GetxController {
  var aa = RxString("Page1117");
  var mapController = RxMap();
}

class Page117 extends GetView<AwesomeController> {
  final controller = Get.put(AwesomeController());

  @override
  Widget build(BuildContext context) {
    var map = Get.arguments as Map;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.aa.value),
            Text("Get.arguments==${map['name']}"),
            Text("mapController==${controller.mapController.value['name']}"),
          ],
        ),
      ),
    );
  }
}
