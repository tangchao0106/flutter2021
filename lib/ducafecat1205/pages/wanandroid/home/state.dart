import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gongzhonghao.dart';

class GzhState {
  var _gzhCategories = Rx<List<Gongzhonghao>?>(null);
  // var _gzhCategories = Rx<List<Gongzhonghao>?>(null);

  set gzhCategories(value) => _gzhCategories.value = value;

  get gzhCategories => _gzhCategories.value;
}
