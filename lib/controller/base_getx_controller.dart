import 'package:get/get.dart';
import 'package:untitled/view/demo/get/wanandroid/compents/state_page.dart';

typedef Success(dynamic value);
typedef Failure(dynamic value);
typedef Done(dynamic value);


abstract class BaseGetxController extends GetxController{
  var loadState=LoadState.DONE.obs;

  void handleRequest(Future<dynamic> future,bool isloading,
      Success success,{Failure? failure,Done? done}){
    if(isloading){
      loadState.value=LoadState.DONE;
    }
    future.then((value) => success(value))
        .onError((error, stackTrace) async {
          if(isloading){
            loadState.value=LoadState.FAILURE;
          }
          if(error.code){}
    })



  }
}