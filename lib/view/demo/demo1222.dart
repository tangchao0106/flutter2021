import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';
import 'package:untitled/ducafecat1205/common/widget/image.dart';

class Demo1222 extends StatelessWidget {
  Demo1222({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("11111"),
          Text("11111"),
          // InkWell(
          //   onTap: () {},
          //   child: netImageCached("", width: 120.w, height: 120.h),
          // ),
          // SizedBox(
          //   width: 10.w,
          // ),
          // Expanded(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           child: Text(
          //             "",
          //             style: TextStyle(
          //               fontWeight: FontWeight.normal,
          //               fontSize: 14.sp,
          //               height: 1,
          //             ),
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {},
          //           splashColor: Colors.red,
          //           child: Container(
          //               margin: EdgeInsets.only(top: 10.h),
          //               child: Text(
          //                 "",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w500,
          //                   fontSize: 14.sp,
          //                   height: 1,
          //                 ),
          //                 overflow: TextOverflow.clip,
          //                 maxLines: 3,
          //               )),
          //         ),
          //         // Spacer(),
          //         Container(
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               ConstrainedBox(
          //                 constraints: BoxConstraints(maxWidth: 60.w),
          //                 child: Text(
          //                   "",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 14.sp,
          //                     height: 1,
          //                   ),
          //                   overflow: TextOverflow.clip,
          //                   maxLines: 1,
          //                 ),
          //               ),
          //               ConstrainedBox(
          //                 constraints: BoxConstraints(maxWidth: 100.w),
          //                 child: Text(
          //                   "2021",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 14.sp,
          //                     height: 1,
          //                   ),
          //                   overflow: TextOverflow.clip,
          //                   maxLines: 1,
          //                 ),
          //               ),
          //               Spacer(),
          //               InkWell(
          //                 child: Icon(
          //                   Icons.more_horiz,
          //                   size: 23.sp,
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ],
          //     ))
        ],
      ),
    );
  }


}
