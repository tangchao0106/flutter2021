import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/demo/Messages.dart';
import 'package:untitled/view/demo/get/CounterGetLogic.dart';

class CountGetPage extends StatelessWidget {
  const CountGetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CounterGetLogic());
    bool ch = true;
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('en', 'US'),
      getPages: [GetPage(name: "/Page117", page: () => Page117())],
      home: Scaffold(
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
              title: Text("${'hello'.tr}"),
            ),
            Divider(),
            GetX<CounterGetLogic>(builder: (logic) {
              return Text("GetX==${logic.count.toString()}");
            }),
            Divider(),
            GetBuilder<CounterGetLogic>(
                builder: (logic) =>
                    Text("GetBuilder=${logic.count.toString()}")),
            Divider(),

            GestureDetector(
              onTap: () {
                Get.toNamed("/Page117");
                // Get.to(Page117(), arguments: {'user': 'tc'});
              },
              child: Text("Get.toNamed"),
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
  var aa = RxString("Page117");
}

class Page117 extends GetView<AwesomeController> {
  final controller = Get.put(AwesomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.aa.value),
      ),
    );
  }
}
