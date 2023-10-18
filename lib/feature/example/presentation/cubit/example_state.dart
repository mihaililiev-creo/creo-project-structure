part of 'example_cubit.dart';

@immutable
sealed class ExampleState {}

final class ExampleInitial extends ExampleState {}

final class ExampleLoading extends ExampleState {}

final class ExampleContent extends ExampleState {
  ExampleContent({required this.exampleModel});

  final ExampleModel exampleModel;
}

final class ExampleError extends ExampleState {
  ExampleError({required this.message});

  final String message;
}
