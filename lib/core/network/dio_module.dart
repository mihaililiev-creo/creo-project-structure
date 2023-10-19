import 'package:creo_project_structure/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  final apiUrl = const String.fromEnvironment(
    EnvironmentKeys.API_URL,
    defaultValue: 'https://example/api/v1/',
  );

  @lazySingleton
  Dio get dio {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
      ),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );

    return dio;
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';

    return handler.next(options);
  }

  void _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  void _onError(DioException exception, ErrorInterceptorHandler handler) {
    handler.next(exception);
  }
}
