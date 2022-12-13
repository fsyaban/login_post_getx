import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx/domain/core/providers/login_provider.dart';
import 'package:login_getx/infrastructure/dal/daos/register_request.dart';
import 'package:login_getx/infrastructure/dal/services/login_service.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';

class RegisterController extends GetxController {
  final LoginService _provider = LoginProvider();

  var isLoading = false.obs;

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var typeUserController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void register() async {
    var request = RegisterRequest(
        name: nameController.text,
        phoneNumber: mobileController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text);
    isLoading.value = true;
    await _provider.register(request).then((value) {
      if (value.isSuccess ?? false) {
        Get.defaultDialog(
            title: "Berhasil",
            content: Text(value.message ?? ""),
            onConfirm: () {
              Get.offNamed(Routes.LOGIN);
            },
            confirmTextColor: Colors.white);
      } else {
        Get.defaultDialog(
            title: "Gagal",
            content: Text(value.message ?? ""),
            onConfirm: () {
              Get.back();
            },
            confirmTextColor: Colors.white);
      }
    });
      isLoading.value = false;

  }
}
