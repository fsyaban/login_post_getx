import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardScreen'),
        centerTitle: true,
      ),
      body: Obx(() => Center(
            child: Column(
              children: [
                Text(
                  "token ${controller.user.value.token}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "name ${controller.user.value.name}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "username ${controller.user.value.username}",
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: Text("Log out"))
              ],
            ),
          )),
    );
  }
}
