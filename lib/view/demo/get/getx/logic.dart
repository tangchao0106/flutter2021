import 'package:get/get.dart';
import 'package:untitled/view/demo/bean/Person.dart';

class GetxLogic extends GetxController with StateMixin<Person> {
  var count = 0.obs;

  increment() => count++;

  final String userId;

  GetxLogic({required this.userId});

  @override
  void onReady() {
    // getPersonalProifile(userId);
  }
}

// void getPersonalProifile(String userId) async {
//   change(null, RxStatus.loading());
//   var persion = await getid(userId);
//   if (persion != null) {
//     change(persion, RxStatus.success());
//   } else {
//     change(null, RxStatus.error("查询失败"));
//   }
// }

getid(String userId) {}
