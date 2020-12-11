// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../datamodels/trip.dart';
import '../ui/views/add/add_view.dart';
import '../ui/views/auth/auth_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/trip/trip_view.dart';

class Routes {
  static const String authView = '/';
  static const String homeView = '/home-view';
  static const String addView = '/add-view';
  static const String tripView = '/trip-view';
  static const String mapView = '/map-view';
  static const all = <String>{
    authView,
    homeView,
    addView,
    tripView,
    mapView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.addView, page: AddView),
    RouteDef(Routes.tripView, page: TripView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AddView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddView(),
        settings: data,
      );
    },
    TripView: (data) {
      final args = data.getArgs<TripViewArguments>(
        orElse: () => TripViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TripView(
          key: args.key,
          trip: args.trip,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TripView arguments holder class
class TripViewArguments {
  final Key key;
  final Trip trip;
  TripViewArguments({this.key, this.trip});
}
