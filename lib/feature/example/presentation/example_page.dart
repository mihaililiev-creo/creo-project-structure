import 'package:auto_route/auto_route.dart';
import 'package:creo_project_structure/core/injection_container.dart';
import 'package:creo_project_structure/feature/example/presentation/cubit/example_cubit.dart';
import 'package:creo_project_structure/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExamplePage extends StatelessWidget implements AutoRouteWrapper {
  const ExamplePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ExampleCubit>(
        create: (context) => getIt<ExampleCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExampleCubit, ExampleState>(
      bloc: context.read<ExampleCubit>(),
      listener: (ctx, state) {
        if (state is ExampleUnknownError) {
          // Show snack bar for errors that we do not have specific ErrorModel
          ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is ExampleNetworkError) {
          // Show dialog for network (DioException)
          // errors that we do have specific ErrorModel
          openDialog(context, state.message);
        }
        if (state is ExampleContent) {
          ScaffoldMessenger.of(ctx).showSnackBar(
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
    );
  }

  void openDialog(BuildContext context, String error) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Dialog for custom error'),
        content: Text('Custom error message: $error'),
        actions: <Widget>[
          TextButton(
              child: const Text('Try again'),
              onPressed: () {
                Navigator.of(ctx).pop();
                context.read<ExampleCubit>().getSomeStrings();
              }),
          FilledButton(
            child: const Text('Okay'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }
}
