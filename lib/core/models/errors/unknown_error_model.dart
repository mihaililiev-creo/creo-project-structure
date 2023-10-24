part of 'error_model.dart';
class UnknownErrorModel extends ErrorModel {
  UnknownErrorModel({
    this.object,
  });

  final Object? object;

  @override
  String toString() => object.toString();
}