import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: UserListRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: UserDetailsRoute.page,
        ),
      ];
}
