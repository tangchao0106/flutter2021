import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/middlewares/router_auth.dart';
import 'package:untitled/ducafecat1205/common/routes/app_routes.dart';
import 'package:untitled/ducafecat1205/pages/frame/application/binding.dart';
import 'package:untitled/ducafecat1205/pages/frame/application/view.dart';
import 'package:untitled/ducafecat1205/pages/frame/sign_in/bindings.dart';
import 'package:untitled/ducafecat1205/pages/frame/sign_in/view.dart';
import 'package:untitled/ducafecat1205/pages/frame/welcome/bindings.dart';
import 'package:untitled/ducafecat1205/pages/frame/welcome/view.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => WelcomePage(),
        binding: WelcomeBinding()),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => SignInPage(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.Application,
        page: () => ApplicationPage(),
        binding: ApplicationBinding(),
        // middlewares: [RouteAuthMiddleware(priority: 1)]
    )
  ];
}
