import 'package:equatable/equatable.dart';
import './failure.dart';

import 'result_error.dart';

// ignore: constant_identifier_names
enum Status { LOADING, SUCCESS, REJECTED, FAIL }

abstract class Result<T> extends Equatable {
  final Status status;

  const Result._(this.status);

  const factory Result.success(T data) = Success<T>;

  // ignore: avoid_positional_boolean_parameters
  const factory Result.loading(bool isLoading) = Loading<T>;

  const factory Result.rejected(ResultError error) = Rejected<T>;

  const factory Result.error(Failure error) = Fail<T>;
}

class Fail<T> extends Result<T> {
  final Failure error;

  const Fail(this.error) : super._(Status.FAIL);

  @override
  List<Object> get props => [error];
}

class Rejected<T> extends Result<T> {
  final ResultError error;

  const Rejected(this.error) : super._(Status.REJECTED);

  @override
  List<Object> get props => [error];
}

class Loading<T> extends Result<T> {
  final bool isLoading;

  // ignore: avoid_positional_boolean_parameters
  const Loading(this.isLoading) : super._(Status.LOADING);

  @override
  List<Object> get props => [isLoading];
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data) : super._(Status.SUCCESS);

  @override
  List<Object> get props => [data!];
}
