// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:pricelocq_temp/screens/landing/landing_view.dart' as _i4;
import 'package:pricelocq_temp/screens/login/login_view.dart' as _i3;
import 'package:pricelocq_temp/screens/search_station/search_station_view.dart'
    as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.LoginView(key: args.key));
    },
    LandingRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.LandingView());
    },
    SearchStationRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.SearchStationView());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/'),
        _i1.RouteConfig(LandingRoute.name, path: '/landing-view'),
        _i1.RouteConfig(SearchStationRoute.name, path: '/search-station-view'),
        _i1.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i2.Key? key})
      : super(name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i2.Key? key;
}

class LandingRoute extends _i1.PageRouteInfo<void> {
  const LandingRoute() : super(name, path: '/landing-view');

  static const String name = 'LandingRoute';
}

class SearchStationRoute extends _i1.PageRouteInfo<void> {
  const SearchStationRoute() : super(name, path: '/search-station-view');

  static const String name = 'SearchStationRoute';
}
