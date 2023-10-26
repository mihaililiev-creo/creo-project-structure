import 'package:creo_project_structure/core/injection_container.dart';
import 'package:creo_project_structure/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:creo_project_structure/i18n/strings.g.dart';

import 'core/theme/design_system.dart';
import 'core/theme/testapp_theme.dart';

void main() {
  configureDependencies();
  final AppRouter appRouter = AppRouter();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp(this._appRouter, {super.key});

  final AppRouter _appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: TestappTheme.buildTheme(DesignSystem.light()),
      darkTheme: TestappTheme.buildTheme(DesignSystem.dark()),
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return ErrorHandlerWidget(
          child: Scaffold(
            body: child!,
          ),
        );
      },
    );
  }
}

class ErrorHandlerWidget extends StatefulWidget {
  final Widget child;

  const ErrorHandlerWidget({super.key, required this.child});

  @override
  State<ErrorHandlerWidget> createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends State<ErrorHandlerWidget> {
  // Error handling logic
  void onError(FlutterErrorDetails errorDetails) {
    // Add your error handling logic here, e.g., logging, reporting to a server, etc.
    print('Caught error: ${errorDetails.exception}');
  }

  @override
  Widget build(BuildContext context) {
    return ErrorWidgetBuilder(
      builder: (context, errorDetails) {
        // Display a user-friendly error screen
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(
            child: Column(
              children: [
                Text(t.somethingWentWrong),
              ],
            ),
          ),
        );
      },
      onError: onError,
      child: widget.child,
    );
  }
}

class ErrorWidgetBuilder extends StatefulWidget {
  final Widget Function(BuildContext, FlutterErrorDetails) builder;
  final void Function(FlutterErrorDetails) onError;
  final Widget child;

  const ErrorWidgetBuilder({
    super.key,
    required this.builder,
    required this.onError,
    required this.child,
  });

  @override
  State<ErrorWidgetBuilder> createState() => _ErrorWidgetBuilderState();
}

class _ErrorWidgetBuilderState extends State<ErrorWidgetBuilder> {
  @override
  void initState() {
    super.initState();
    // Set up global error handling
    FlutterError.onError = widget.onError;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}