import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/categories.dart';

class MainState {
  //分类
  var _categories = Rx<List<CategoryResponseEntity>?>(null);
  set categories(value)=>_categories.value=value;
  get categories=>_categories.value;

}
