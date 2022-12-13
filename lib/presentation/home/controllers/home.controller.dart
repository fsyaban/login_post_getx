import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('user');
    if (token != null) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      if (kDebugMode) {
        print("token kosong");
      }
    }
    super.onInit();
  }
}
