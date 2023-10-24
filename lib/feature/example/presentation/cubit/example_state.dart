part of 'example_cubit.dart';

@immutable
sealed class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

final class ExampleInitial extends ExampleState {}

final class ExampleLoading extends ExampleState {}

final class ExampleContent extends ExampleState {
  const ExampleContent({required this.exampleModel});

  final ExampleModel exampleModel;
}

final class ExampleNetworkError extends ExampleState {
  const ExampleNetworkError({required this.message});

  final String message;

  @override
  String toString() => message;

  @override
  List<Object> get props => [message];
}

final class ExampleUnknownError extends ExampleState {
  const ExampleUnknownError({required this.message});

  final String message;

  @override
  String toString() => message;

  @override
  List<Object> get props => [message];
}
