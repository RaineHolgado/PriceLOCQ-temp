import 'package:auto_route/auto_route.dart';
import 'package:pricelocq_temp/screens/landing/landing_view.dart';
import 'package:pricelocq_temp/screens/login/login_view.dart';
import 'package:pricelocq_temp/screens/search_station/search_station_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(page: LoginView, initial: true),
    AutoRoute(page: LandingView),
    AutoRoute(page: SearchStationView),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
