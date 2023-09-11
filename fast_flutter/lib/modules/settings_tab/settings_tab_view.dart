import 'package:fast_flutter/router/local_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_tab_logic.dart';

class SettingsTabPage extends StatelessWidget {
  SettingsTabPage({Key? key}) : super(key: key);

  final logic = Get.put<SettingsTabLogic>(SettingsTabLogic());
  final state = Get.find<SettingsTabLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("settings"),
          ElevatedButton(
              onPressed: (){
                Get.toNamed(BaseRoute.settings);
              },
              child: const Text("设置")
          ),
        ],
      ),
    );
  }
}
