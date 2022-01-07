import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gonghonghao2.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gongzhonghao.dart';

class GzhState {
  var _gzhCategories = Rx<List<Gongzhonghao2>?>(null);
  set gzhCategories(value) => _gzhCategories.value = value;
  get gzhCategories => _gzhCategories.value;

  //公众号人员的id
  var _gzhid = "0000".obs;

  set gzhid(value) => _gzhid.value = value;

  get gzhid => _gzhid.value;
}
