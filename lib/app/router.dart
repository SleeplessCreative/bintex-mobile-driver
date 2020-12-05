import 'package:auto_route/auto_route_annotations.dart';
import 'package:bintex_mobile_driver/ui/views/add/add_view.dart';

import '../ui/views/auth/auth_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/add/add_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AuthView, initial: true),
    MaterialRoute(page: AddView),
  ],
)
class $Router {}
