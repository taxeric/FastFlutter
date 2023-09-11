class MxNetError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  MxNetError(this.code, this.message, {this.data});
}