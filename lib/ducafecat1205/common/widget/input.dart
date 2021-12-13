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
  bool isPassword=false,
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
      decoration: InputDecoration(hintText: hintText,contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9)),
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
