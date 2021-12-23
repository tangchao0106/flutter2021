import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';
import 'package:untitled/ducafecat1205/common/utils/date.dart';
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
      height: 100.h,
      margin: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: netImageCached(item.thumbnail ?? "",
                width: 120.w, height: 120.h),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  item.author ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                splashColor: Colors.red,
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                  item.title ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                )),
              ),
              Spacer(),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 60.w),
                      child: Text(
                        item.category ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    ConstrainedBox(

                      constraints: BoxConstraints(maxWidth: 100.w),
                      child: Text(
                        "${duTimeLineFormat(item.addtime ?? DateTime(0))}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        size: 23.sp,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
