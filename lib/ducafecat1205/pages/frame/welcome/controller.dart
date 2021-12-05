import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/routes/app_routes.dart';
import 'package:untitled/ducafecat1205/pages/frame/welcome/state.dart';

class WelcomeController extends GetxController{
  final state=WelcomeState();
  WelcomeController();
  handleNavSignIn(){
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}