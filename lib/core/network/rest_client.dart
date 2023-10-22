import 'package:creo_project_structure/feature/example/data/model/example_dto.dart';
import 'package:creo_project_structure/feature/example/data/repository/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/some-data/')
  Future<ExampleDto> getSomeData();
}

@module
abstract class RestModule {
  @lazySingleton
  RestClient client(Dio dio) {
    return RestClient(dio);
  }

  @lazySingleton
  ExampleClient exampleClient(Dio dio) {
    return ExampleClient(dio);
  }
}
