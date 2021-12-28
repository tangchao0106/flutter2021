import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/ducafecat1205/pages/frame/category/logic.dart';

import 'news_item.dart';

class NewsPageList extends StatefulWidget {
  NewsPageList({Key? key}) : super(key: key);

  @override
  State<NewsPageList> createState() => _NewsPageListState();
}

class _NewsPageListState extends State<NewsPageList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SmartRefresher(
        controller: controller.refreshController,
        enablePullUp: true,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (content, index) {
                    var item = controller.state.newsList[index];
                    return newsListItem(item);
                  },
                  childCount: controller.state.newsList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return GetX<CategoryController>(
    //   init: controller,
    //   builder: (controller) => SmartRefresher(
    //     enablePullUp: true,
    //     controller: controller.refreshController,
    //     onRefresh: controller.onRefresh,
    //     onLoading: controller.onLoading,
    //     child: CustomScrollView(
    //       slivers: [
    //         // SliverPadding(
    //         //   padding: EdgeInsets.symmetric(
    //         //     vertical: 0.w,
    //         //     horizontal: 0.w,
    //         //   ),
    //         //   sliver: SliverList(
    //         //     delegate: SliverChildBuilderDelegate(
    //         //           (content, index) {
    //         //         var item = controller.state.newsList[index];
    //         //         return newsListItem(item);
    //         //       },
    //         //       childCount: controller.state.newsList.length,
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
