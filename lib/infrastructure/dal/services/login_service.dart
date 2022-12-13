import 'package:get/get.dart';
import 'package:login_getx/domain/core/models/register_model.dart';
import 'package:login_getx/infrastructure/dal/daos/login_request.dart';
import 'package:login_getx/infrastructure/dal/daos/register_request.dart';

import '../../../domain/core/models/login_model.dart';

abstract class LoginService {
  Future<Login> login(LoginRequest request);

  Future<Register> register(RegisterRequest request);
}
