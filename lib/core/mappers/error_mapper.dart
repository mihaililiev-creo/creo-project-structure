import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/errors/error_model.dart';

part 'dio_error_mapper.dart';

typedef Callback<E> = Future<E> Function();

@lazySingleton
class ErrorMapper {
  ErrorMapper(this._dioErrorMapper);

  final DioErrorMapper _dioErrorMapper;

  Future<E> execute<E>(
    Callback<E> callback,
  ) async {
    try {
      return await callback();
    } on ErrorModel {
      rethrow;
    } on Exception catch (e) {
      throw _mapExceptionToBusinessError(e);
    } catch (e) {
      throw UnknownErrorModel(object: e);
    }
  }

  ErrorModel _mapExceptionToBusinessError(Exception exception) {
    if (exception is DioException) {
      return _dioErrorMapper.asErrorModel(exception);
    }

    return UnknownErrorModel(object: exception);
  }
}

extension ResponseErrorToString on Response {
  String? mapToString() => data is Map<String, dynamic> ? data['error'] : null;
}
