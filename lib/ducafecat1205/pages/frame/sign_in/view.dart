import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/values/shadows.dart';
import 'package:untitled/ducafecat1205/common/widget/button.dart';
import 'package:untitled/ducafecat1205/common/widget/input.dart';
import 'package:untitled/ducafecat1205/pages/frame/sign_in/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: (40 + 44.0).h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    height: 76.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        // boxShadow: [Shadows.primaryShadow],
                        borderRadius:
                            BorderRadius.all(Radius.circular((76 * 0.5).w))),
                    child: Container(),
                  ),
                  left: 0,
                  top: 0,
                  right: 0,
                ),
                Positioned(
                    // top: 13.w,
                    child: Image.asset(
                      "assets/images/spide_logo.png",
                      fit: BoxFit.none,
                    )),
              ],
            ),
          ),
          Container(
            width: 76.w,
            height: 40.h,
            alignment: Alignment.center,
            child: Text(
              "蜘蛛侠",
              style: TextStyle(
                  fontSize: 24.sp, height: 1, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "tangchao",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, height: 1),
          )
        ],
      ),
    );
  }

//登录表单
  Widget _buildForm() {
    return Container(
      width: 310.w,
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          inputTextEdit(
              hintText: "账号",
              margintop: 0,
              controller: controller.emailController),
          inputTextEdit(
              hintText: "密码",
              margintop: 0,
              textInputType: TextInputType.visiblePassword,
              isPassword: true,
              controller: controller.passController),
          Container(
            height: 44.h,
            margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.h),
            child: Row(
              children: [
                btnFlatButtonWidget(
                    onPressed: controller.handleNavSignUp, title: "注册"),
                Spacer(),
                btnFlatButtonWidget(
                    gbColor: AppColors.thirdElement,
                    onPressed: controller.handleSignIn,
                    title: "登录"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          Text(
            "第三方登录",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, width: 88, iconFileName: "weixin"),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, width: 88, iconFileName: "weixin"),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, width: 88, iconFileName: "weixin"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
          onPressed: controller.handleNavSignUp,
          width: 294,
          title: "一键登录",
          fontSize: 16),
    );
  }
}
