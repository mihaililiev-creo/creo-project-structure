import 'package:creo_project_structure/feature/example/data/repository/client.dart';
import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';
import 'package:creo_project_structure/feature/example/domain/repository/example_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/mappers/error_mapper.dart';

@LazySingleton(as: ExampleRepository)
class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(
    this._client,
    this._errorMapper,
  );

  final ExampleClient _client;
  final ErrorMapper _errorMapper;

  @override
  Future<ExampleModel> getExample() async {
    return _errorMapper.execute(() async {
      //   simulateDioError();
      //   simulateUnknownError();
      // return ExampleModel(
      //     name: '',
      //     subscriptionPlan: SubscriptionPlan.free,
      //     age: 1,
      //     isExample: true);
      return (await _client.getExampleDto()).toModel();
    });
  }

  // Simulate Unknown error showing on the UI s
  void simulateUnknownError() {
    throw Exception('unknownSimulated');
  }

  void simulateDioError() {
    throw DioException(
      type: DioExceptionType.badResponse,
      requestOptions: RequestOptions(
        path: 'api_endpoint',
      ),
      response: Response(
        statusCode: 404,
        data: 'Simulated error response data',
        requestOptions: RequestOptions(),
      ),
    );
  }

  @override
  Future<List> getSomeOtherThings() {
    // TODO: implement getSomeOtherThings
    throw UnimplementedError();
  }
}
