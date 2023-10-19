import 'package:creo_project_structure/core/network/rest_client.dart';
import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';
import 'package:creo_project_structure/feature/example/domain/repository/example_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExampleRepository)
class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(this._client);

  final RestClient _client;

  @override
  Future<ExampleModel> getExample() async {
    return (await _client.getExampleDto()).toModel();
  }

  @override
  Future<List> getSomeOtherThings() {
    // TODO: implement getSomeOtherThings
    throw UnimplementedError();
  }
}
