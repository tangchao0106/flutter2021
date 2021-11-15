import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Test2Page extends StatelessWidget {
  final logic = Get.put(Test2Logic());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return Text("${logic.ba}");
      }),
    );
  }
}
