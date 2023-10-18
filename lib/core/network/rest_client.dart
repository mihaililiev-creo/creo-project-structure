import 'package:creo_project_structure/feature/example/data/model/example_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/some-strings/')
  Future<ExampleDto> getExampleDto();
}
