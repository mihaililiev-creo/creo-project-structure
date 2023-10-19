import 'package:auto_route/auto_route.dart';
import 'package:creo_project_structure/core/injection_container.dart';
import 'package:creo_project_structure/feature/example/presentation/cubit/example_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleCubit>(
      create: (context) => getIt<ExampleCubit>(),
      child: Center(
          child: FilledButton(
        child: const Text("Example"),
        onPressed: () => context.read<ExampleCubit>().getSomeStrings(),
      )),
    );
  }
}
