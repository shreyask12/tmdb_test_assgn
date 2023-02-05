import 'package:dio/dio.dart' show DioError;
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int? statusCode;
  String get message => _message;
  final String _message;

  const Failure(this.statusCode, this._message);

  factory Failure.from(
    DioError error,
  ) {
    return Failure(error.response?.statusCode, ' ${error.message}');
  }

  @override
  List<Object?> get props => [statusCode, message];
}
