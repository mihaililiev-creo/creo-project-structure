part of 'error_mapper.dart';

extension _DioErrorMapper on DioException {
  ErrorModel asErrorModel() {
    if (type == DioExceptionType.badResponse && response != null) {
      if (response!.statusCode == 500) {
        return ServerErrorModel();
      }

      if (response!.statusCode == 403) {
        return AccessDeniedErrorModel();
      }

      if (response!.statusCode == 404) {
        return NotFoundErrorModel(
          message: response!.mapToString(),
        );
      }
    }
    print('GG ${error.toString()}');
    return NetworkErrorModel(error.toString());
  }
}
