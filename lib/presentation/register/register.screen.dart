import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:get/get.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:login_getx/main.dart';
import 'package:login_getx/presentation/helper.dart';

import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterScreen'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.all(50),
                children: [
                  Column(
                    children: [
                      LogoEvon(),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: controller.nameController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Full Name",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.mobileController,
                        autocorrect: false,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.emailController,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.typeUserController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Type User",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: controller.isPasswordHidden.value,
                        controller: controller.passwordController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isPasswordHidden.toggle();
                            },
                            icon: controller.isPasswordHidden.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: controller.isConfirmPasswordHidden.value,
                        controller: controller.confirmPasswordController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isConfirmPasswordHidden.toggle();
                            },
                            icon: controller.isConfirmPasswordHidden.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GradientBlueButton(
                          onPress: () {
                            controller.register();
                          },
                          text: "Sign Up"),
                      SizedBox(
                        height: 30,
                      ),
                      Text("or"),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: SignInButton(
                          Buttons.Facebook,
                          onPressed: () {},
                          text: "Sign Up with Facebook",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () {},
                          text: "Sign Up with Google",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("By signing up you accept the"),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Terms of Service",
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("and"),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Privacy Police",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an Account?"),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Log in",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )));
  }
}
