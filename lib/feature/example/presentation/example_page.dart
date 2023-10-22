import 'package:auto_route/auto_route.dart';
import 'package:creo_project_structure/core/injection_container.dart';
import 'package:creo_project_structure/feature/example/presentation/cubit/example_cubit.dart';
import 'package:creo_project_structure/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleCubit>(
      create: (context) => getIt<ExampleCubit>(),
      child: BlocConsumer<ExampleCubit, ExampleState>(
        listener: (context, state) {
          if (state is ExampleError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is ExampleContent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exampleModel.toString()),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: FilledButton(
              child: Text(t.example),
              onPressed: () => context.read<ExampleCubit>().getSomeStrings(),
            ),
          );
        },
      ),
    );
  }
}
