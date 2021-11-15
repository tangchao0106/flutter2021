import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetxPage extends StatelessWidget {
  final logic = Get.put(GetxLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("${logic.count}")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Others());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Others extends StatelessWidget {
  Others({Key? key}) : super(key: key);
  GetxLogic controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${controller.count}"),
      ),
    );
  }
}
