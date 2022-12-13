import 'package:get/get_connect/http/src/request/request.dart';

class RegisterRequest {
  String? name;
  String? phoneNumber;
  String? email;
  String typeUser = "PTN";
  String? password;
  String? confirmPassword;

  RegisterRequest(
      {this.name,
      this.phoneNumber,
      this.email,
      this.typeUser = "PTN",
      this.password,
      this.confirmPassword});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['mobile'] = phoneNumber;
    data['email'] = email;
    data['type_user'] = typeUser;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    return data;
  }
}
