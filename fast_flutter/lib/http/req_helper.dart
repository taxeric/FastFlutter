
import 'http_method.dart';

class MxReq {

  bool _useHttps;
  String _host;
  String _url;
  String _mUrl = "";
  final HttpMethod method;
  final Map<String, dynamic> _headers;
  final Map<String, String> _params;

  MxReq(this._useHttps, this._host, this._url, this._headers, this._params, {this.method = HttpMethod.GET}) {
    _mUrl = _url;
    _generateUrl();
  }

  set host(String value) {
    _host = value;
    _url = _mUrl;
    _generateUrl();
  }

  String get host => _host;

  void _generateUrl() {
    Uri uri;
    var pathStr = _url;
    print(">>>> path str $pathStr");
    if (_useHttps) {
      uri = Uri.https(_host, pathStr, _params);
    } else {
      uri = Uri.http(_host, pathStr, _params);
    }
    _url = uri.toString();
  }

  String get url => _url;

  Map<String, dynamic> get headers => _headers;

  Map<String, String> get params => _params;
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

  MxReq build() {
    return MxReq(useHttps, host, url, headers, params, method: method);
  }
}