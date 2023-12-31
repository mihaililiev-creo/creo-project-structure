import 'package:auto_route/auto_route.dart';
import 'package:creo_project_structure/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ExampleRoute.page, initial: true),
      ];
}
