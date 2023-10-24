import 'package:creo_project_structure/core/models/errors/error_model.dart';
import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';
import 'package:creo_project_structure/feature/example/domain/repository/example_repository.dart';
import 'package:creo_project_structure/feature/example/presentation/cubit/example_cubit.dart';
import 'package:flutter_test/flutter_test.dart' ;
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockRepository extends Mock implements ExampleRepository {}

void main() {
  var mockExample = ExampleModel(
    name: '',
    subscriptionPlan: SubscriptionPlan.free,
    age: 1,
    isExample: true,
  );

  group('ExampleCubit', () {
    late ExampleRepository repository;

    setUp(() {
      repository = MockRepository();
    });

    test('initial state is ExampleInitial', () {
      expect(
        ExampleCubit(repository).state,
        ExampleInitial(),
      );
    });

    group('emit success after fetching example', () {
      blocTest<ExampleCubit, ExampleState>(
        'emits ExampleContent after fetching ExampleModel',
        setUp: () {
          when(repository.getExample).thenAnswer((_) async => mockExample);
        },
        build: () => ExampleCubit(repository),
        act: (cubit) => cubit.getSomeStrings(),
        expect: () => [
          ExampleLoading(),
          ExampleContent(exampleModel: mockExample),
        ],
        verify: (_) => verify(repository.getExample).called(1),
      );

      blocTest<ExampleCubit, ExampleState>(
        'emits ExampleUnknownError after failing to fetch ExampleModel',
        setUp: () {
          when(repository.getExample).thenThrow( UnknownErrorModel());
        },
        build: () => ExampleCubit(repository),
        act: (cubit) => cubit.getSomeStrings(),
        expect: () => [
          ExampleLoading(),
           const ExampleUnknownError(message: 'null' ),
        ],
        verify: (_) => verify(repository.getExample).called(1),
      );

      blocTest<ExampleCubit, ExampleState>(
        'emits ExampleNetworkError after failing to fetch ExampleModel',
        setUp: () {
          when(repository.getExample).thenThrow(Exception('Error'));
        },
        build: () => ExampleCubit(repository),
        act: (cubit) => cubit.getSomeStrings(),
        expect: () => [
          ExampleLoading(),
          const ExampleNetworkError( message: 'Exception: Error'),
        ],
        verify: (_) => verify(repository.getExample).called(1),
      );

    });
  });
}
