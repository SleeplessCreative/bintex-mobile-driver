// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/add/add_view.dart';
import '../ui/views/auth/auth_view.dart';
import '../ui/views/home/home_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String authView = '/';
  static const String addView = '/add-view';
  static const all = <String>{
    homeView,
    authView,
    addView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.addView, page: AddView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    AddView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddView(),
        settings: data,
      );
    },
  };
}
