import 'package:fast_flutter/http/base_request.dart';
import 'package:fast_flutter/http/mx_adapter_config.dart';

class MxReq {

  bool useHttps;
  String host;
  String url;
  final HttpMethod method;
  final Map<String, dynamic> headers;
  final Map<String, String> params;

  MxReq(this.useHttps, this.host, this.url, this.headers, this.params, {this.method = HttpMethod.GET}) {
    Uri uri;
    var pathStr = url;
    if (useHttps) {
      uri = Uri.https(host, pathStr, params);
    } else {
      uri = Uri.http(host, pathStr, params);
    }
    url = uri.toString();
  }
}

class ReqBuilder {

  bool useHttps = false;
  String host = "";
  String url = "";
  HttpMethod method = HttpMethod.GET;
  final Map<String, dynamic> headers = Map();
  final Map<String, String> params = Map();

  ReqBuilder setHost(String host) {
    this.host = host;
    return this;
  }

  ReqBuilder setUrl(String url) {
    this.url = url;
    return this;
  }

  ReqBuilder setMethod(HttpMethod method) {
    this.method = method;
    return this;
  }

  ReqBuilder addHeader(String k, Object v) {
    headers[k] = v.toString();
    return this;
  }

  ReqBuilder addParam(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  MxReq build({bool useConfigHost = true}) {
    var mHost = host;
    if (useConfigHost) {
      mHost = base_host;
    }
    return MxReq(useHttps, mHost, url, headers, params, method: method);
  }
}