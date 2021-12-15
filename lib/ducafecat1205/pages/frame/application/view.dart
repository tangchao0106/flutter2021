import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/common/widget/app.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/view.dart';

import 'logic.dart';

class ApplicationPage extends GetView<ApplicationPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(
              () {
            return Text(
              controller.tabTitles[controller.state.page],
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            );
          },
        ),
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: Icon(Icons.search))
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        MainPage(),
        Text('CategoryPage'),
        Text('BookmarksPage'),
        Text('AccountPage'),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      );
    });
  }
}
