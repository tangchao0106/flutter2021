import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/ducafecat1205/common/utils/date.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/widget/image.dart';

import '../controller.dart';

class NewsRecommendWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Obx(() => controller.state.newsRecommend == null
        ? Container()
        : Container(
            margin: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: netImageCached(
                      controller.state.newsRecommend.thumbnail,
                      width: 335.w,
                      height: 290.h),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14.h),
                  child: Text(
                    "作者：${controller.state.newsRecommend.author}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.thirdElement),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  hoverColor: Colors.amber,
                  child: Container(
                    child: Text(
                      controller.state.newsRecommend.title,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.thirdElement),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          "分类${controller.state.newsRecommend.category}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.secondaryElementText),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        width: 15.w,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Text(
                          "${duTimeLineFormat(controller.state.newsRecommend.addtime)}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.thirdElement),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.primaryText,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
  }
}
