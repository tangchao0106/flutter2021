import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/api/gzh.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gonghonghao2.dart';

import 'controller.dart';

class WandroidHomePage extends GetView<wandroidgzhController> {
  @override
  Widget build(BuildContext context) {
    print("WandroidHomePage==");
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
                    child: InkWell(child: Text(item.name,style: TextStyle(
                      fontSize: 18.sp

                    ),),onTap: ()=>{
                      Get.snackbar("title", "message==${item.name}")
                    },),
                  );
                }).toList(),
              ),
            )),
    );
  }
}
