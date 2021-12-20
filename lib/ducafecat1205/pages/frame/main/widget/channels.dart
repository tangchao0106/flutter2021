import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/values/shadows.dart';

import '../controller.dart';

class NewsChannelsWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => controller.state.channels == null
        ? Container()
        : Container(
            height: 80.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.state.channels.map<Widget>((item) {
                  return Container(
                    width: 79.w,
                    // height: 120.h,
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 64.w,
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 64.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBackground,
                                        boxShadow: [Shadows.primaryShadow],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    child: Container(),
                                  ),
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                ),
                                Positioned(
                                  left: 10.w,
                                  right: 10.w,
                                  child: Image.asset(
                                    "assets/images/channel-${item.code}.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ));
  }
}
