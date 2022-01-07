import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/utils/iconfont.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';

import 'state.dart';

class ApplicationPageController extends GetxController {
  final ViewState state = ViewState();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged(int page) {
    state.page = page;
  }

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    tabTitles = ['Welcome', '玩安卓公众号', 'Bookmarks', 'Account'];
    bottomTabs = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.home,
          color: AppColors.secondaryElementText,
        ),
        label: 'main',
        backgroundColor: Colors.pink,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.person,
          color: AppColors.secondaryElementText,
        ),
        label: '玩安卓',
        backgroundColor: AppColors.primaryBackground,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          Icons.sanitizer,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.sanitizer,

          color: AppColors.secondaryElementText,
        ),
        label: 'tag',
        backgroundColor: AppColors.primaryBackground,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          Icons.satellite,

          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.satellite,

          color: AppColors.secondaryElementText,
        ),
        label: 'my',
        backgroundColor: AppColors.primaryBackground,
      ),
    ];
    pageController = new PageController(initialPage: state.page);
  }
}
