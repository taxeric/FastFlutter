enum HttpMethod {
  GET, POST, DELETE,
}

abstract class BaseRequest {

  var pathParams;
  var useHttps = false;

  String authority() {
    return "turtledove.com.cn:8080";
  }

  HttpMethod httpMethod();

  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = Map();

  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = Map();
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}