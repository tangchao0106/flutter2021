import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/api/gzh.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gonghonghao2.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';

import 'controller.dart';

class WandroidHomePage extends GetView<wandroidgzhController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => controller.state.gzhCategories == null
          ? Container()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.state.gzhCategories.map<Widget>((item) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    height: 52.h,
                    alignment: Alignment.center,
                    child: InkWell(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          print("111message==${controller.state.gzhid == item.id.toString()} ");
                          return Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: controller.state.gzhid == item.id.toString()
                                    ? AppColors.secondaryElementText
                                    : AppColors.primaryText),
                          );
                        },
                      ),
                      onTap: () => {
                        controller.loadDataByID(item.id),
                        Get.snackbar(
                            "title", "1message==${controller.state.gzhid}"),
                      },
                    ),
                  );
                }).toList(),
              ),
            )),
    );
  }
}
