import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:login_getx/presentation/helper.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('LoginScreen'),
          centerTitle: true,
        ),
        body: controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                children: [
                  Column(
                    children: [
                      LogoEvon(),
                      SizedBox(
                        height: 60,
                      ),
                      TextField(
                        
                        controller: controller.emailController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
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
                      GradientBlueButton(
                          onPress: () {
                            controller.login();
                          },
                          text: "Log in"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Or"),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 50,
                          width: double.infinity,
                          child: SignInButton(
                            Buttons.Facebook,
                            onPressed: () {},
                            text: "Log in with Facebook",
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 50,
                          width: double.infinity,
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {},
                            text: "Log in with Google",
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account ?"),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )));
  }
}
