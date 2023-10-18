import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';

abstract class ExampleRepository {
  Future<ExampleModel> getExample();
  Future<List<dynamic>> getSomeOtherThings();
}
