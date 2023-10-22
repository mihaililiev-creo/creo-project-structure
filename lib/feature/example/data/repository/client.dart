import 'package:creo_project_structure/feature/example/data/model/example_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class ExampleClient {
  factory ExampleClient(Dio dio, {String baseUrl}) = _ExampleClient;

  @GET('/example/')
  Future<ExampleDto> getExampleDto();
}
