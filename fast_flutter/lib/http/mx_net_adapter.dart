import 'dart:convert';

import 'package:fast_flutter/http/req_helper.dart';

abstract class MxNetAdapter {
  Future<MxNetResponse<T>> send<T>(MxReq req);
}

class MxNetResponse<T> {

  MxNetResponse({
    this.data,
    this.request,
    this.statucCode = 0,
    this.statusMessage = "",
    this.extra
  });

  T? data;
  MxReq? request;
  int statucCode;
  String statusMessage;
  dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}