import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../articleDetail.dart';
import 'logic.dart';

class GetxPage extends StatelessWidget {
  final logic = Get.put(GetxLogic(userId: "3"));

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // theme: ThemeData(primaryColor: Theme.of(context).primaryColor),
        home: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text("${logic.count}")),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(ArticleDetail());
            },
            child: Icon(Icons.add),
          ),
        ));
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
