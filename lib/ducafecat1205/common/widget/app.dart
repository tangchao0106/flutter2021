import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';

/// 透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    centerTitle: true,
    leading: leading,
    actions: actions,
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 10.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
