import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'example_dto.mapper.dart';

@MappableClass()
class ExampleDto with ExampleDtoMappable {
  ExampleDto(
    this.name,
    this.subscriptionPlan,
    this.age,
    this.isExample,
    this.numberOfOrders,
  );

  String name;
  String subscriptionPlan;
  int age;
  bool isExample;
  int? numberOfOrders;

  static const fromJson = ExampleDtoMapper.fromMap;

  ExampleModel toModel() {
    return ExampleModel(
      name: name,
      subscriptionPlan: SubscriptionPlan.values
          .firstWhere((element) => element.name == subscriptionPlan),
      age: age,
      isExample: isExample,
      numberOfOrders: numberOfOrders,
    );
  }
}
