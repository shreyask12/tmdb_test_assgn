import 'package:dio/dio.dart' show DioError, RequestOptions;

class ResultError extends DioError {
  final int httpStatusCode;
  final String statusMessage;
  final List<dynamic> _errors;

  ResultError(this.httpStatusCode, this.statusMessage, this._errors)
      : super(requestOptions: RequestOptions(path: ""));

  @override
  ResultError get error => this;

  @override
  String get message => _errors.isNotEmpty
      ? (_errors.first as Map<String, dynamic>)["message"] as String
      : toString();

  @override
  String toString() {
    var msg = 'ResultError [$type]: $statusMessage';
    if (error is Error) {
      msg += '\n${error.message}';
    }
    return msg;
  }
}
