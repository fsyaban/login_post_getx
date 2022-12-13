class Register {
  int? code;
  bool? isSuccess;
  String? message;

  Register({this.code, this.isSuccess, this.message});

  Register.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}
