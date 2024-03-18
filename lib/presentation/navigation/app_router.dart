import 'package:auto_route/auto_route.dart';

import '../screen/initialization/screen.dart';
import '../screen/landing/screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, initial: true),
        CustomRoute(
          page: InitializationRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
