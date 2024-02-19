import 'package:equatable/equatable.dart';

import 'exception.dart';

class Failure extends Equatable {
  final String failureMessage;
  final ExceptionType? exceptionType;
  const Failure(
    this.failureMessage, [
    this.exceptionType,
  ]);
  @override
  List<Object?> get props => [failureMessage];
}
