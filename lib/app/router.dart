import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/auth/auth_view.dart';
import '../ui/views/home/home_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AuthView, initial: true),
  ],
)
class $Router {}
