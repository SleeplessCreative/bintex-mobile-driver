import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/add/add_view.dart';
import '../ui/views/auth/auth_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/trip/trip_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AuthView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AddView),
    MaterialRoute(page: TripView),
  ],
)
class $Router {}
