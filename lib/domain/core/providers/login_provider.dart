import 'dart:convert';

import 'package:get/get.dart';
import 'package:login_getx/domain/core/Const.dart';
import 'package:login_getx/domain/core/models/login_model.dart';
import 'package:login_getx/domain/core/models/register_model.dart';
import 'package:login_getx/infrastructure/dal/daos/login_request.dart';
import 'package:login_getx/infrastructure/dal/daos/register_request.dart';
import 'package:login_getx/infrastructure/dal/services/login_service.dart';

class LoginProvider extends GetConnect implements GetxService, LoginService {
  @override
  Future<Login> login(LoginRequest request) async {
    try {
      var response = await post("${Const.baseUrl}niaga/auth/login",
          {"username": request.username, "password": request.password});

      if (response.isOk) {
        return Login.fromJson(response.body);
      }
      return Future.error(response.statusText ?? "");
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<Register> register(RegisterRequest request) async {
    try {
      var response =
          await post("${Const.baseUrl}niaga/auth/register", request.toJson());

      if (response.isOk) {
        return Register.fromJson(response.body);
      }
      return Future.error(response.statusText ?? "");
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
