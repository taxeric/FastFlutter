import 'package:fast_flutter/http/req_helper.dart';

import 'mx_adapter.dart';

class NetHelper {
  NetHelper._();
  static NetHelper? _instance;
  static NetHelper getInstance() {
    _instance ??= NetHelper._();
    return _instance!;
  }

  Future<dynamic> sendMx(MxReq request) async {
    print("url >>>> ${request.url}");
    print("met >>>> ${request.method}");
    print("hea >>>> ${request.headers}");
    print("par >>>> ${request.params}");
    var adapter = MxAdapter();
    return adapter.send(request);
  }
}