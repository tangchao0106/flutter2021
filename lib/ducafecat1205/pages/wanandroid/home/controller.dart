import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/api/gzh.dart';
import 'package:untitled/ducafecat1205/pages/wanandroid/home/state.dart';

class wandroidgzhController extends GetxController {
  GzhState state = GzhState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadData();
  }

  loadData() async {
    state.gzhCategories = await GongZhongHaoApi.Futurechapters();
  }

  loadDataByID(categorycode, {bool refrsh = false}) async {
    state.gzhid = categorycode.toString();
    print("state.gzhid   ${state.gzhid}  categorycode==$categorycode");
  }
}
