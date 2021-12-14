import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/api/user.dart';
import 'package:untitled/ducafecat1205/common/entity/user.dart';
import 'package:untitled/ducafecat1205/common/routes/app_routes.dart';
import 'package:untitled/ducafecat1205/pages/frame/sign_in/state.dart';

import '../../../../global.dart';

class SignInController extends GetxController {
  final state = SignInState();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  SignInController();

  handleNavSignUp() {}

  handleSignIn() async {
    UserLoginRequestEntity params = UserLoginRequestEntity(
        email: emailController.value.text, password: passController.value.text);

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    print("userProfile====$userProfile");
    // Global.saveProfile(userProfile);
    Get.offAndToNamed(AppRoutes.Application);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passController.dispose();
    emailController.dispose();

  }
}
