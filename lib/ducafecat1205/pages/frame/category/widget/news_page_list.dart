import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/ducafecat1205/pages/frame/category/logic.dart';

class NewsPageList extends StatefulWidget {
  NewsPageList({Key? key}) : super(key: key);

  @override
  State<NewsPageList> createState() => _NewsPageListState();
}

class _NewsPageListState extends State<NewsPageList>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<CategoryController>(
      init: controller,
      builder: (controller) => SmartRefresher(
        controller: controller.refreshController,
        enablePullUp: true,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [

          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
