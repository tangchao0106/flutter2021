import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';

import '../controller.dart';

class NewsCategoriesWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.categories == null
        ? Container()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.state.categories.map<Widget>((item) {
                return Container(
                  alignment: Alignment.center,
                  height: 52.h,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    child: Text(
                      item.title,
                      style: TextStyle(
                          color: controller.state.selCategoryCode == item.code
                              ? AppColors.secondaryElementText
                              : AppColors.primaryText,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () => {
                      controller.asyncLoadNewsData(item.code)
                    },
                  ),
                );
              }).toList(),
            ),
          ));
  }
}
