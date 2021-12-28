import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/pages/frame/category/widget/news_page_list.dart';

import 'logic.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NewsPageList(),
    );
  }
}
