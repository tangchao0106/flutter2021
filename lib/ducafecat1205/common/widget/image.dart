import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/values/radii.dart';

/// 缓存图片
Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry? margin,
}) {
  return CachedNetworkImage(
    // imageUrl: url,
    imageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202105%2F01%2F20210501121822_0e765.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642490344&t=f54a981eed6eca3a15d913316cc6fc4e",
    imageBuilder: (context, imageProvider) => Container(
      height: height.h,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        // child: CircularProgressIndicator(),
        child: Image.asset('assets/images/weixin.png')

      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
