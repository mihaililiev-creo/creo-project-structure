import 'package:creo_project_structure/feature/example/domain/model/example_model.dart';
import 'package:creo_project_structure/feature/example/domain/repository/example_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'example_state.dart';

@injectable
class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit(this._exampleRepository) : super(ExampleInitial());

  final ExampleRepository _exampleRepository;

  Future<void> getSomeStrings() async {
    emit(ExampleLoading());
    try {
      final exampleModel = await _exampleRepository.getExample();
      emit(ExampleContent(exampleModel: exampleModel));
    } catch (e) {
      emit(ExampleError(message: e.toString()));
    }
  }
}
