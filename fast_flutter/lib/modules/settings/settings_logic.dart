import 'package:fast_flutter/caches/preference_helper.dart';
import 'package:fast_flutter/caches/preferences/preferences_config.dart';
import 'package:get/get.dart';

import 'settings_state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();

  @override
  void onInit() {
    super.onInit();
    PreferenceHelper
        .getString(PreferencesConfig.key_host)
        .then((value) {
      state.requestHost.value = value;
    });
    PreferenceHelper
    .getInt(PreferencesConfig.key_port)
    .then((value) {
      state.requestPort.value = value;
    });
  }

  String buildRequestInfo() {
    if (state.requestHost.isEmpty) {
      return "";
    }
    return "${state.requestHost.value}:${state.requestPort.value}";
  }
}
