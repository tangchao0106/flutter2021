import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/values/radii.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
      width: width.w,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fontColor,
            fontFamily: fontName,
            fontWeight: fontWeight,
            fontSize: fontSize.sp,
            height: 1,
          ),
        ),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 16.sp,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.deepOrange;
              } else {
                return fontColor;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue[200];
            }
            return gbColor;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          )),
        ),
      ));
}

Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ))),
      child: Image.asset("assets/images/$iconFileName.png"),
    ),
  );
}
