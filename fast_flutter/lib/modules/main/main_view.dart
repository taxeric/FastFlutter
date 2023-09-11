import 'package:fast_flutter/modules/spirit_tab/spirit_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings_tab/settings_tab_view.dart';
import '../home_tab/home_tab_view.dart';
import 'main_logic.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final logic = Get.find<MainLogic>();
  final state = Get
      .find<MainLogic>()
      .state;

/*  final List<Widget> _bodyPage = [
    const HomeTabPage(),
    const SpiritTabPage(),
    SettingsTabPage(),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: const Text("Faster Flutter")),
      ),
      // body: Obx(() => _bodyPage[state.bottomBarIndex.value]),
      body: Obx(() {
        return IndexedStack(
            index: state.bottomBarIndex.value,
            children: logic.bodyPage
        );
      }),
      bottomNavigationBar: Obx(() =>
          BottomNavigationBar(
              currentIndex: state.bottomBarIndex.value,
              onTap: (index) {
                logic.switchBtnIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.catching_pokemon), label: "spirit"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings"),
              ]
          )
      ),
    );
  }
}
