// https://wanandroid.com/wxarticle/chapters/json
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gonghonghao2.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gongzhonghao.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';
import 'package:untitled/ducafecat1205/common/utils/http2.dart';

class GongZhongHaoApi {
  static var logger = Logger();

  static Future<List<Gongzhonghao2>> Futurechapters({
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil2().get("/wxarticle/chapters/json",
        refresh: refresh, cacheDisk: cacheDisk);
    // logger.d("公众号= jsonDecode  ${jsonDecode(response)}");
    // logger.d("公众号=jsonEncode   ${jsonEncode(response)}");
    var data = response['data'];
    var bb= data.map<Gongzhonghao2>((item) => Gongzhonghao2.fromJson(item));
    logger.d("公众号=bb   ${bb.runtimeType}");
    List<Gongzhonghao2> growableList =[];
    for(var n in bb) {
      // logger.d("公众号=bb   ${n}");
      growableList.add(n);
    }
    logger.d("公众号=bb   ${growableList.runtimeType}");
    logger.d("公众号=bb   ${growableList.length}");

    // return response['data'].map<Gongzhonghao2>((item) {
    //   // logger.d("公众号=item   ${Gongzhonghao2.fromJson(item)}");
    //   return Gongzhonghao2.fromJson(item);
    // });
    return growableList;
    // .toList;
  }
}
