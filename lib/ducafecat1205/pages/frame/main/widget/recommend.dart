import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller.dart';

class NewsRecommendWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("object==${controller.state.newsRecommend}");
    print("object==${controller.state.newsRecommend.thumbnail}");
    return Obx(() => controller.state.newsRecommend == null
        ? Container()
        : Container(
            child: Column(
              children: [
                Image.network(controller.state.newsRecommend.thumbnail)
              ],
            ),
          ));
  }
}
