import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_logic.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final logic = Get.find<SettingsLogic>();
  final state = Get.find<SettingsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("设定请求地址"),
            subtitle: Obx(() => Text(logic.buildRequestInfo())),
            onTap: (){},
          )
        ],
      ),
    );
  }

  void showRequestDialog(BuildContext context) {
    // showDialog(context: context, builder: builder);
  }
}
