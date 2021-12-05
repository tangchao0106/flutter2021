import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/values/radii.dart';
import 'controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildPageHeadTitle(),
            _buildPageHeaderDetail(),
            _buildFeatureItem("feature-1", "11", 86),
            _buildFeatureItem("feature-2", "11", 40),
            // _buildFeatureItem("feature-3", "11", 40),
            // Spacer() 相当于弹簧的效果,使两个控件之间的距离达到最大值. (在页面不可滑动时才有效果)
            Spacer(),
            _buildStartButton(context),
          ],
        ),
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton(BuildContext context) {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 16.sp,
          )),
          foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
              if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.deepPurple;
              }
              return AppColors.primaryElementText;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue[200];
            }
            return AppColors.primaryElement;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          )),
        ),
        child: Text("Get started"),
        onPressed: controller.handleNavSignIn,
      ),
    );
  }

  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: 295.w,
      height: 80.h,
      margin: EdgeInsets.only(top: marginTop.h),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: 195.w,
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageHeaderDetail() {
    return Container(
      width: 242.w,
      height: 70.h,
      margin: EdgeInsets.only(top: 14.h),
      child: Text(
        "rtyuiop",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontSize: 16.sp,
            height: 1.3),
      ),
    );
  }

//标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: (60 + 44).h), // 顶部系统栏 44p
      child: Text(
        "_buildPageHeadTitle",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            height: 1),
      ),
    );
  }

}


