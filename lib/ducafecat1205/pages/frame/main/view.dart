import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/widget/categories.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/widget/channels.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/widget/news_list.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/widget/recommend.dart';

import 'controller.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewsCategoriesWidget(),
          Divider(),
          NewsRecommendWidget(),
          Divider(),
          NewsChannelsWidget(),
          Divider(),
          NewsListWidget(),
        ],
      ),
    );
  }
}
