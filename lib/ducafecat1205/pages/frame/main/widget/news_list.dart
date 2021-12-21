import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/widget/image.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/controller.dart';

class NewsListWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.newsPageList == null
        ? Container()
        : Column(
            children: controller.state.newsPageList.items.map<Widget>((item) {
              List<Widget> widgets = [
                _buildListItem(item),
                Divider(
                  height: 1,
                ),
              ];

              return Column(
                children: widgets,
              );
            }).toList(),
          ));
  }

  Widget _buildListItem(NewsItem item) {
    // print("item.thumbnai==${item.thumbnail??""}");
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: netImageCached(item.thumbnail ?? "",
                width: 120.w, height: 120.h),
          ),
          // SizedBox(
          //   width: 200.w,
          //     child: Column(
          //   children: [
          //     Container(
          //       child: Text(
          //         item.author ?? "",
          //         style: TextStyle(
          //           fontWeight: FontWeight.normal,
          //           color: AppColors.thirdElementText,
          //           fontSize: 14.sp,
          //           height: 1,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       child: Text("标题"),
          //     ),
          //     Spacer(),
          //     Container(
          //       child: Text("底部一行3列"),
          //     ),
          //   ],
          // ))
        ],
      ),
    );
  }
}
