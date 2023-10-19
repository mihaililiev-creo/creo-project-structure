import 'package:creo_project_structure/core/injection_container.dart';
import 'package:creo_project_structure/core/routes/app_router.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
