import 'package:conference/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  RxBool selected = false.obs;

  @override
  void onInit() {
    super.onInit();
    bool rememberMe = GetStorage().read("rememberMe") ?? false;
    bool isLoggedIn = GetStorage().read('token') != null;

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.offAllNamed(rememberMe && isLoggedIn ? Routes.MAIN : Routes.WELCOME);
    });
  }
}
