part of 'error_mapper.dart';

@lazySingleton
class DioErrorMapper {
  ErrorModel asErrorModel(DioException dioException) {
    if (dioException.type == DioExceptionType.badResponse && dioException.response != null) {
      if (dioException.response!.statusCode == 500) {
        return ServerErrorModel();
      }

      if (dioException.response!.statusCode == 403) {
        return AccessDeniedErrorModel();
      }

      if (dioException.response!.statusCode == 404) {
        return NotFoundErrorModel(
          message: dioException.response!.mapToString(),
        );
      }
    }
    return NetworkErrorModel(dioException.toString());
  }
}
