import 'package:fast_flutter/caches/preference/preferences_config.dart';
import 'package:fast_flutter/caches/preference_helper.dart';
import 'package:fast_flutter/http/mx_adapter_config.dart';
import 'package:fast_flutter/http/req_helper.dart';

import 'mx_adapter.dart';

class NetHelper {
  NetHelper._();

  Future<void> _init() async {
    var host = await PreferenceHelper.getString(PreferencesConfig.key_host);
    var port = await PreferenceHelper.getInt(PreferencesConfig.key_port);
    if (host.endsWith("/")) {
      host = host.substring(0, host.length - 1);
    }
    var mHost = "$host:$port";
    var startIndex = 0;
    var endIndex = mHost.length;
    if (mHost.contains("http")) {
      startIndex = mHost.indexOf("//") + 2;
    }
    if (mHost.endsWith("/")) {
      endIndex --;
    }
    mHost = mHost.substring(startIndex, endIndex);
    base_host = mHost;
  }

  static bool hostIsValid() {
    return base_host.isNotEmpty && base_host.contains("http");
  }

  static NetHelper? _instance;
  static NetHelper getInstance() {
    _instance ??= NetHelper._();
    return _instance!;
  }

  Future<dynamic> sendMx(MxReq request, {bool useBaseHost = true}) async {
    if (useBaseHost) {
      if (!hostIsValid()) {
        await _init();
      }
      // request
      request.host = base_host;
    }
    print("url >>>> ${request.url}");
    print("met >>>> ${request.method}");
    print("hea >>>> ${request.headers}");
    print("par >>>> ${request.params}");
    var adapter = MxAdapter();
    return adapter.send(request);
  }
}