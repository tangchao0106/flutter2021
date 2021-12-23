import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/controller.dart';

//订阅部分
class NewsletterWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "最近订阅",
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 18.sp,
                ),
                onPressed: () {
                  Get.snackbar("标题", "订阅",backgroundColor: AppColors.tabBarElement);
                },
              ),
            ],
          ),
          //emain
          Divider(),
          Container(
            child: Text("邮箱"),
          ),
          Container(
            child: Text("订阅"),
          ),
          Container(
            child: Text("权限说明"),
          ),
        ],
      ),
    );
  }
}
