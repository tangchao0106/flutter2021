import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/values/radii.dart';

Widget inputTextEdit({
  String? hintText,
  double? margintop,
  TextInputType textInputType = TextInputType.text,
  bool autofocus = false,
  bool isPassword = false,
  required TextEditingController controller,
}) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(top: margintop!.h),
    decoration: BoxDecoration(
        color: AppColors.secondaryElement, borderRadius: Radii.k6pxRadius),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9)),
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );

  }

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      maxLines: 1,
      autocorrect: false,
      // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
