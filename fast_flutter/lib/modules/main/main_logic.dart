import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../router/local_routers.dart';
import '../home_tab/home_tab_view.dart';
import '../settings_tab/settings_tab_view.dart';
import '../spirit_tab/spirit_tab_view.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  HomeTabPage homePage = const HomeTabPage();
  SpiritTabPage? spiritPage;
  SettingsTabPage? settingsPage;
  
  List<Widget> bodyPage = List.generate(3, (index) => const Placeholder());

  @override
  void onInit() {
    super.onInit();
    bodyPage[0] = homePage;
  }

  switchBtnIndex(int index) {
    switch (index) {
      case 1: 
        if (spiritPage == null) {
          spiritPage = const SpiritTabPage();
          bodyPage[index] = spiritPage!;
        }
        break;
      case 2:
        if (settingsPage == null) {
          settingsPage = SettingsTabPage();
          bodyPage[index] = settingsPage!;
        }
        break;
    }
    state.bottomBarIndex.value = index;
  }
}
