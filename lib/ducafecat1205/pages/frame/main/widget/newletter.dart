import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/widget/button.dart';
import 'package:untitled/ducafecat1205/common/widget/input.dart';
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
                  Get.snackbar("标题", "订阅",
                      backgroundColor: AppColors.tabBarElement);
                },
              ),
            ],
          ),
          //emain
          Divider(),
          inputEmailEdit(
              controller: null,
              marginTop: 10,
              keyboardType: TextInputType.emailAddress,
              hintText: "请输入邮箱",
              isPassword: false),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: btnFlatButtonWidget(
                onPressed: () {}, width: 300.w, gbColor: Colors.green),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                text: '权限说明',
                style: new TextStyle(
                  color: AppColors.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                  text: '隐私安全，隐私安全隐私安全，隐私安全隐私安全，隐私安全',
                  style: TextStyle(
                      color: AppColors.secondaryElementText,
                      fontWeight: FontWeight.w400),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.snackbar("", "	指定手势交互可以监听点击事件",
                          backgroundColor: Colors.amber[100]);
                    }),
            ])),
          ),
        ],
      ),
    );
  }
}
