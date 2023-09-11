import 'package:dio/dio.dart';
import 'package:fast_flutter/http/base_request.dart';
import 'package:fast_flutter/http/req_helper.dart';

import 'mx_error.dart';
import 'mx_net_adapter.dart';

class MxAdapter extends MxNetAdapter {
  @override
  Future<MxNetResponse<T>> send<T>(MxReq req) async {
    var response, option = Options(headers: req.headers);
    var error;
    try {
      if (req.method == HttpMethod.GET) {
            response = await Dio().get(req.url, options: option);
          } else if (req.method == HttpMethod.POST) {
            response = await Dio().post(req.url, data: req.params, options: option);
          }
    } on DioException catch (e) {
      error = e;
      response = e.response;
    }
    
    if (error != null) {
      print(error);
      throw MxNetError(
          (response as Response).statusCode??-1,
          error.toString(),
          data: buildRes(response, req)
      );
    }
    return buildRes(response, req);
  }

  buildRes(Response<dynamic> response, MxReq req) {
    return MxNetResponse(
      data: response.data,
      request: req,
      statucCode: response.statusCode??-1,
      statusMessage: response.statusMessage??"未知错误",
      extra: response.extra
    );
  }
}