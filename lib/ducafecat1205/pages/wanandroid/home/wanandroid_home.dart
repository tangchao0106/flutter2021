import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/api/gzh.dart';

import 'controller.dart';

class WandroidHomePage extends GetView<wandroidgzhController> {
  @override
  Widget build(BuildContext context) {
    print("WandroidHomePage==");
    return Container(
      child: Obx(() =>
      controller.state.gzhCategories == null
          ? Container()
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.state.gzhCategories.map((item) {
            return Container(
              child: Text(item.name),
            );
          }).toList(),
        ),
      )),
    );
  }
}
