import 'package:get/get.dart';

import '../../caches/preference/preferences_config.dart';
import '../../caches/preference_helper.dart';
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
      return "暂未设置";
    }
    var mHost = state.requestHost.value;
    if (mHost.endsWith("/")) {
      mHost = mHost.substring(0, mHost.length - 1);
    }
    return "$mHost:${state.requestPort.value}/";
  }

  void setRequestInfo(String host, int port) {
    state.requestHost.value = host;
    state.requestPort.value = port;
    PreferenceHelper.put(PreferencesConfig.key_host, host);
    PreferenceHelper.put(PreferencesConfig.key_port, port);
  }
}
