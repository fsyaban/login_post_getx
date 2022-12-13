import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_getx/infrastructure/navigation/routes.dart';
import 'package:login_getx/presentation/helper.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.checkLogin();
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoEvon(),
                  Text("EVON",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: GoogleFonts.nunito().fontFamily)),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Discover upcoming events near you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily: GoogleFonts.nunito().fontFamily)),
                  SizedBox(
                    height: 100,
                  ),
                  GradientBlueButton(
                      onPress: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      text: "Sign Up"),
                  SizedBox(height: 20),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(width: 1, color: Colors.blue)),
                    height: 60,
                    minWidth: double.infinity,
                    color: Colors.white,
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Skip for now",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
