part of 'error_model.dart';

class NetworkErrorModel extends ErrorModel {
  NetworkErrorModel(this._errorMessage);

  final String? _errorMessage;

  String get error => _errorMessage ?? '';

  @override
  String toString() => 'NetworkError: $error';
}
