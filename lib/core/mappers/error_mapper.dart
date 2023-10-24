
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/errors/error_model.dart';

part 'dio_error_mapper.dart';

typedef Callback<E> = Future<E> Function();

@injectable
class ErrorMapper {
  Future<E> execute<E>(
    Callback<E> callback,
  ) async {
    try {
      return await callback();
    } catch (e, _) {
      throw _mapToBusinessModel(e);
    }
  }

  Object _mapToBusinessModel(Object object) {
    if (object is ErrorModel) {
      return object;
    }

    if (object is Exception) {
      return _mapExceptionToBusinessError(object);
    }

    return object;
  }

  ErrorModel _mapExceptionToBusinessError(Exception exception) {
    if (exception is DioException) {
      return exception.asErrorModel();
    }

    return UnknownErrorModel(exception: exception);
  }
}

extension ResponseErrorToString on Response {
  String? mapToString() => data is Map<String, dynamic> ? data['error'] : null;
}
