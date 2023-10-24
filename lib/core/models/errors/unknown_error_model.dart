part of 'error_model.dart';
class UnknownErrorModel extends ErrorModel {
  UnknownErrorModel({
    this.exception,
  });

  final Exception? exception;

  @override
  String toString() => exception.toString();
}