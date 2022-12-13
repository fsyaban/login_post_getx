import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx/domain/core/providers/login_provider.dart';
import 'package:login_getx/infrastructure/dal/daos/login_request.dart';
import 'package:login_getx/infrastructure/dal/services/login_service.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/models/login_model.dart';

class LoginController extends GetxController {
  final LoginService _provider = Get.put(LoginProvider());
  var isPasswordHidden = true.obs;

  var isLoginSuccess = false.obs;

  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _isFormValid() =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  void login() async {
    if (_isFormValid()) {
      isLoading.toggle();
      var loginRequest = LoginRequest(
          username: emailController.text, password: passwordController.text);

      await _provider.login(loginRequest).then((value) async {
        if (value.isSuccess ?? false) {
          //success login
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('user', jsonEncode(value.data?.toJson()));
          Get.snackbar("Success", value.message ?? "");
          Get.offAllNamed(Routes.HOME);
        } else {
          //gagal login
          Get.defaultDialog(
              title: "Gagal",
              content: Text(value.message ?? ""),
              confirmTextColor: Colors.white,
              onConfirm: (() {
                Get.back();
              }));
        }
      }).onError((error, stackTrace) {
        Get.snackbar("error", error.toString());
      });

      isLoading.toggle();
    } else {
      Get.defaultDialog(
          content: Text("Harap Masukan Username & Password"),
          confirmTextColor: Colors.white,
          onConfirm: (() {
            Get.back();
          }));
    }
  }
}
