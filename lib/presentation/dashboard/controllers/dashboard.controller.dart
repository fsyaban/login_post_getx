import 'dart:convert';

import 'package:get/get.dart';
import 'package:login_getx/domain/core/models/login_model.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var tokenx = "token".obs;
  var user = Data().obs;

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userString = prefs.getString('user');
    if (userString != null) {
      user.value = Data.fromJson(jsonDecode(userString));
    }
    super.onInit();
  }
}
